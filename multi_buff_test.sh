#!/bin/bash

i=1

while [ $i -le 13 ]
 do
 v.extract --overwrite InvPoint_dragonfly  output=point_select where="cat="$i""
 v.buffer --overwrite input=point_select output=point_select_buff type=point distance=500
 v.type --overwrite input=point_select output=point_select_cent type=point,centroid
# v.patch --overwrite input=point_select_cent,point_select_buff output=point_select_patch
# db.copy from_table=point_select_cent to_table=point_select_patch
# v.db.connect map=point_select_patch table=point_select_patch
# v.overlay --overwrite ainput=point_select_patch binput=landuse_diss output=veg_overlay_point"$i" operator=and
# v.db.addcol map=veg_overlay_point"$i" columns="area DOUBLE PRECISION"
# v.to.db map=veg_overlay_point"$i" option=area units=meters columns=area
# v.out.ogr input=veg_overlay_point"$i" type=area dsn=/C/GIS_DATA olayer=point"$i"_buffer
 eval i=`expr "$i" + 1`
done
