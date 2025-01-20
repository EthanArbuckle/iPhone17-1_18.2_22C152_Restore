@interface ActiveTileGroupDebugController
+ (id)navigationDestinationTitle;
- (ActiveTileGroupDebugController)init;
- (ActiveTileGroupDebugController)initWithResourceManifest:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)activeTileGroupOverridesDidChange:(id)a3;
- (void)dealloc;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ActiveTileGroupDebugController

+ (id)navigationDestinationTitle
{
  return @"Active Tile Group";
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v3 = [(ActiveTileGroupDebugController *)self tableView];
  [v3 reloadData];
}

- (void)activeTileGroupOverridesDidChange:(id)a3
{
  id v3 = [(ActiveTileGroupDebugController *)self tableView];
  [v3 reloadData];
}

- (ActiveTileGroupDebugController)init
{
  v2 = [(ActiveTileGroupDebugController *)self initWithResourceManifest:0];
  id v3 = v2;
  if (v2)
  {
    v2->_canChangeTileGroup = 1;
    v4 = +[GEOResourceManifestManager modernManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100741EA0;
    v10[3] = &unk_1012F7288;
    v5 = v3;
    v11 = v5;
    [v4 getResourceManifestWithHandler:v10];

    v6 = +[GEOResourceManifestManager modernManager];
    [v6 addTileGroupObserver:v5 queue:&_dispatch_main_q];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"activeTileGroupOverridesDidChange:" name:@"ActiveTileGroupOverridesDidChangeNotification" object:0];

    v8 = v5;
  }

  return v3;
}

- (ActiveTileGroupDebugController)initWithResourceManifest:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ActiveTileGroupDebugController;
  v6 = [(ActiveTileGroupDebugController *)&v11 initWithStyle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceManifest, a3);
    v7->_canChangeTileGroup = 0;
    v8 = [(ActiveTileGroupDebugController *)v7 navigationItem];
    [v8 setRightBarButtonItem:0];

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  id v3 = +[GEOResourceManifestManager modernManager];
  [v3 removeTileGroupObserver:self];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ActiveTileGroupDebugController;
  [(MapsDebugValuesViewController *)&v5 dealloc];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!self->_resourceManifest) {
    return 0;
  }
  if (self->_canChangeTileGroup) {
    return 2;
  }
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  CFStringRef v4 = @"Tile Set Overrides";
  if (a4 != 1) {
    CFStringRef v4 = 0;
  }
  if (a4) {
    return (id)v4;
  }
  else {
    return @"Tile Groups";
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  resourceManifest = self->_resourceManifest;
  if (resourceManifest)
  {
    if (a4 == 1)
    {
      v9 = GEOConfigGetArray();
      v10 = (char *)[v9 count] + 1;
      goto LABEL_7;
    }
    if (!a4)
    {
      BOOL canChangeTileGroup = self->_canChangeTileGroup;
      v9 = [(GEOResourceManifestDownload *)resourceManifest resources];
      v10 = (char *)[v9 tileGroupsCount] + canChangeTileGroup;
LABEL_7:

      goto LABEL_8;
    }
  }
  v10 = 0;
LABEL_8:

  return (int64_t)v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((uint64_t)[v7 section] > 1) {
    goto LABEL_11;
  }
  id v8 = [v7 section];
  if (v8 == (id)1)
  {
    v10 = GEOConfigGetArray();
    id v18 = [v7 row];
    if (v18 < [v10 count])
    {
      id v12 = [v6 dequeueReusableCellWithIdentifier:@"ExistingTileGroupOverrideCell"];
      if (!v12) {
        id v12 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"ExistingTileGroupOverrideCell"];
      }
      v19 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v20 = [v19 objectForKeyedSubscript:GEOActiveTileGroupOverrideStyleKey];
      id v21 = [v20 intValue];

      v22 = [v19 objectForKeyedSubscript:GEOActiveTileGroupOverrideSizeKey];
      id v23 = [v22 intValue];

      v24 = [v19 objectForKeyedSubscript:GEOActiveTileGroupOverrideScaleKey];
      id v25 = [v24 intValue];

      v26 = [v19 objectForKeyedSubscript:GEOActiveTileGroupOverrideVersionKey];
      id v27 = [v26 unsignedIntValue];

      v28 = @"RASTER_STANDARD";
      switch((int)v21)
      {
        case 0:
          break;
        case 1:
          v28 = @"VECTOR_STANDARD";
          break;
        case 2:
          v28 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
          break;
        case 3:
          v28 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
          break;
        case 4:
          v28 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
          break;
        case 5:
          v28 = @"RASTER_STANDARD_BACKGROUND";
          break;
        case 6:
          v28 = @"RASTER_HYBRID";
          break;
        case 7:
          v28 = @"RASTER_SATELLITE";
          break;
        case 8:
          v28 = @"RASTER_TERRAIN";
          break;
        case 11:
          v28 = @"VECTOR_BUILDINGS";
          break;
        case 12:
          v28 = @"VECTOR_TRAFFIC";
          break;
        case 13:
          v28 = @"VECTOR_POI";
          break;
        case 14:
          v28 = @"SPUTNIK_METADATA";
          break;
        case 15:
          v28 = @"SPUTNIK_C3M";
          break;
        case 16:
          v28 = @"SPUTNIK_DSM";
          break;
        case 17:
          v28 = @"SPUTNIK_DSM_GLOBAL";
          break;
        case 18:
          v28 = @"VECTOR_REALISTIC";
          break;
        case 19:
          v28 = @"VECTOR_LEGACY_REALISTIC";
          break;
        case 20:
          v28 = @"VECTOR_ROADS";
          break;
        case 21:
          v28 = @"RASTER_VEGETATION";
          break;
        case 22:
          v28 = @"VECTOR_TRAFFIC_SKELETON";
          break;
        case 23:
          v28 = @"RASTER_COASTLINE_MASK";
          break;
        case 24:
          v28 = @"RASTER_HILLSHADE";
          break;
        case 25:
          v28 = @"VECTOR_TRAFFIC_WITH_GREEN";
          break;
        case 26:
          v28 = @"VECTOR_TRAFFIC_STATIC";
          break;
        case 27:
          v28 = @"RASTER_COASTLINE_DROP_MASK";
          break;
        case 28:
          v28 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
          break;
        case 29:
          v28 = @"VECTOR_SPEED_PROFILES";
          break;
        case 30:
          v28 = @"VECTOR_VENUES";
          break;
        case 31:
          v28 = @"RASTER_DOWN_SAMPLED";
          break;
        case 32:
          v28 = @"RASTER_COLOR_BALANCED";
          break;
        case 33:
          v28 = @"RASTER_SATELLITE_NIGHT";
          break;
        case 34:
          v28 = @"SPUTNIK_VECTOR_BORDER";
          break;
        case 35:
          v28 = @"RASTER_SATELLITE_DIGITIZE";
          break;
        case 36:
          v28 = @"RASTER_HILLSHADE_PARKS";
          break;
        case 37:
          v28 = @"VECTOR_TRANSIT";
          break;
        case 38:
          v28 = @"RASTER_STANDARD_BASE";
          break;
        case 39:
          v28 = @"RASTER_STANDARD_LABELS";
          break;
        case 40:
          v28 = @"RASTER_HYBRID_ROADS";
          break;
        case 41:
          v28 = @"RASTER_HYBRID_LABELS";
          break;
        case 42:
          v28 = @"FLYOVER_C3M_MESH";
          break;
        case 43:
          v28 = @"FLYOVER_C3M_JPEG_TEXTURE";
          break;
        case 44:
          v28 = @"FLYOVER_C3M_ASTC_TEXTURE";
          break;
        case 45:
          v28 = @"RASTER_SATELLITE_ASTC";
          break;
        case 46:
          v28 = @"RASTER_HYBRID_ROADS_AND_LABELS";
          break;
        case 47:
          v28 = @"VECTOR_TRANSIT_SELECTION";
          break;
        case 48:
          v28 = @"VECTOR_COVERAGE";
          break;
        case 52:
          v28 = @"FLYOVER_METADATA";
          break;
        case 53:
          v28 = @"VECTOR_ROAD_NETWORK";
          break;
        case 54:
          v28 = @"VECTOR_LAND_COVER";
          break;
        case 55:
          v28 = @"VECTOR_DEBUG";
          break;
        case 56:
          v28 = @"VECTOR_STREET_POI";
          break;
        case 57:
          v28 = @"MUNIN_METADATA";
          break;
        case 58:
          v28 = @"VECTOR_SPR_MERCATOR";
          break;
        case 59:
          v28 = @"VECTOR_SPR_MODELS";
          break;
        case 60:
          v28 = @"VECTOR_SPR_MATERIALS";
          break;
        case 61:
          v28 = @"VECTOR_SPR_METADATA";
          break;
        case 62:
          v28 = @"VECTOR_TRACKS";
          break;
        case 63:
          v28 = @"VECTOR_RESERVED_2";
          break;
        case 64:
          v28 = @"VECTOR_STREET_LANDMARKS";
          break;
        case 65:
          v28 = @"COARSE_LOCATION_POLYGONS";
          break;
        case 66:
          v28 = @"VECTOR_SPR_ROADS";
          break;
        case 67:
          v28 = @"VECTOR_SPR_STANDARD";
          break;
        case 68:
          v28 = @"VECTOR_POI_V2";
          break;
        case 69:
          v28 = @"VECTOR_POLYGON_SELECTION";
          break;
        case 70:
          v28 = @"VL_METADATA";
          break;
        case 71:
          v28 = @"VL_DATA";
          break;
        case 72:
          v28 = @"PROACTIVE_APP_CLIP";
          break;
        case 73:
          v28 = @"VECTOR_BUILDINGS_V2";
          break;
        case 74:
          v28 = @"POI_BUSYNESS";
          break;
        case 75:
          v28 = @"POI_DP_BUSYNESS";
          break;
        case 76:
          v28 = @"SMART_INTERFACE_SELECTION";
          break;
        case 77:
          v28 = @"VECTOR_ASSETS";
          break;
        case 78:
          v28 = @"SPR_ASSET_METADATA";
          break;
        case 79:
          v28 = @"VECTOR_SPR_POLAR";
          break;
        case 80:
          v28 = @"SMART_DATA_MODE";
          break;
        case 81:
          v28 = @"CELLULAR_PERFORMANCE_SCORE";
          break;
        case 82:
          v28 = @"VECTOR_SPR_MODELS_OCCLUSION";
          break;
        case 83:
          v28 = @"VECTOR_TOPOGRAPHIC";
          break;
        case 84:
          v28 = @"VECTOR_POI_V2_UPDATE";
          break;
        case 85:
          v28 = @"VECTOR_LIVE_DATA_UPDATES";
          break;
        case 86:
          v28 = @"VECTOR_TRAFFIC_V2";
          break;
        case 87:
          v28 = @"VECTOR_ROAD_SELECTION";
          break;
        case 88:
          v28 = @"VECTOR_REGION_METADATA";
          break;
        case 89:
          v28 = @"RAY_TRACING";
          break;
        case 90:
          v28 = @"VECTOR_CONTOURS";
          break;
        case 91:
          v28 = @"RASTER_SATELLITE_POLAR";
          break;
        case 92:
          v28 = @"VMAP4_ELEVATION";
          break;
        case 93:
          v28 = @"VMAP4_ELEVATION_POLAR";
          break;
        case 94:
          v28 = @"CELLULAR_COVERAGE_PLMN";
          break;
        case 95:
          v28 = @"RASTER_SATELLITE_POLAR_NIGHT";
          break;
        case 96:
          v28 = @"UNUSED_96";
          break;
        case 97:
          v28 = @"UNUSED_97";
          break;
        case 98:
          v28 = @"UNUSED_98";
          break;
        case 99:
          v28 = @"UNUSED_99";
          break;
        case 100:
          v28 = @"UNUSED_100";
          break;
        case 101:
          v28 = @"UNUSED_101";
          break;
        case 102:
          v28 = @"UNUSED_102";
          break;
        case 103:
          v28 = @"UNUSED_103";
          break;
        case 104:
          v28 = @"UNUSED_104";
          break;
        case 105:
          v28 = @"UNUSED_105";
          break;
        case 106:
          v28 = @"UNUSED_106";
          break;
        case 107:
          v28 = @"UNUSED_107";
          break;
        case 108:
          v28 = @"UNUSED_108";
          break;
        case 109:
          v28 = @"UNUSED_109";
          break;
        case 110:
          v28 = @"UNUSED_110";
          break;
        case 111:
          v28 = @"UNUSED_111";
          break;
        case 112:
          v28 = @"UNUSED_112";
          break;
        case 113:
          v28 = @"UNUSED_113";
          break;
        case 114:
          v28 = @"UNUSED_114";
          break;
        case 115:
          v28 = @"UNUSED_115";
          break;
        case 116:
          v28 = @"UNUSED_116";
          break;
        case 117:
          v28 = @"UNUSED_117";
          break;
        case 118:
          v28 = @"UNUSED_118";
          break;
        case 119:
          v28 = @"UNUSED_119";
          break;
        default:
          v28 = +[NSString stringWithFormat:@"(unknown: %i)", v21];
          break;
      }
      v41 = [v12 textLabel];
      [v41 setText:v28];

      if (v23 >= 3)
      {
        v42 = +[NSString stringWithFormat:@"(unknown: %i)", v23];
      }
      else
      {
        v42 = *(&off_1012F73C8 + (int)v23);
      }
      if (v25 >= 3)
      {
        v43 = +[NSString stringWithFormat:@"(unknown: %i)", v25];
      }
      else
      {
        v43 = *(&off_1012F73E0 + (int)v25);
      }
      v44 = +[NSString stringWithFormat:@"%@ - %@ - %u", v42, v43, v27];
      v45 = [v12 detailTextLabel];
      [v45 setText:v44];

      [v12 setAccessoryType:1];
      goto LABEL_152;
    }
    id v12 = [v6 dequeueReusableCellWithIdentifier:@"AddActiveTileGroupOverrideCell"];
    if (!v12) {
      id v12 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"AddActiveTileGroupOverrideCell"];
    }
    v29 = [v12 textLabel];
    [v29 setText:@"Add TileSet Override"];
    goto LABEL_29;
  }
  if (v8)
  {
LABEL_11:
    id v12 = 0;
    goto LABEL_153;
  }
  BOOL canChangeTileGroup = self->_canChangeTileGroup;
  v10 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  objc_super v11 = (char *)[v7 row];
  if (v11 < (char *)[v10 tileGroupsCount] + canChangeTileGroup)
  {
    id v12 = [v6 dequeueReusableCellWithIdentifier:@"ActiveTileGroupCell"];
    if (!v12) {
      id v12 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"ActiveTileGroupCell"];
    }
    [v12 setAccessoryView:0];
    v13 = +[UIColor labelColor];
    v14 = [v12 textLabel];
    [v14 setTextColor:v13];

    id v15 = [v7 row];
    if (!canChangeTileGroup || v15)
    {
      v30 = [v10 tileGroupAtIndex:[v7 row] - canChangeTileGroup];
      id v31 = [v30 identifier];

      v32 = +[NSString stringWithFormat:@"%d", v31];
      v33 = [v12 textLabel];
      [v33 setText:v32];

      [v12 setTag:v31];
      if (!GEOConfigGetBOOL()) {
        goto LABEL_30;
      }
      v34 = +[GEOResourceManifestManager modernManager];
      unsigned int v35 = [v34 activeTileGroupIdentifier];

      if (v31 != v35) {
        goto LABEL_30;
      }
      v29 = +[UIColor systemBlueColor];
      v36 = [v12 textLabel];
      [v36 setTextColor:v29];
    }
    else
    {
      if ([v10 tileGroupsCount])
      {
        v16 = [v10 tileGroupAtIndex:0];
        id v17 = [v16 identifier];
      }
      else
      {
        id v17 = 0;
      }
      [v12 setTag:-1];
      if ((GEOConfigGetBOOL() & 1) == 0)
      {
        v37 = +[UIColor systemBlueColor];
        v38 = [v12 textLabel];
        [v38 setTextColor:v37];

        v39 = +[GEOResourceManifestManager modernManager];
        v40 = [v39 activeTileGroup];
        id v17 = [v40 identifier];
      }
      v29 = +[NSString stringWithFormat:@"Default (%d)", v17];
      v36 = [v12 textLabel];
      [v36 setText:v29];
    }

LABEL_29:
LABEL_30:
    [v12 setAccessoryType:1];
    goto LABEL_152;
  }
  id v12 = 0;
LABEL_152:

LABEL_153:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  [v32 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [v6 section];
  if (v7 == (id)1)
  {
    id v18 = [TileSetOverrideDebugController alloc];
    v19 = [(ActiveTileGroupDebugController *)self tableView];
    id v8 = -[TileSetOverrideDebugController initWithStyle:](v18, "initWithStyle:", [v19 style]);

    [(TileSetOverrideDebugController *)v8 setTitle:@"Custom Tile Set Override"];
    GEOConfigGetArray();
    objc_super v11 = (TileGroupSectionsDebugController *)objc_claimAutoreleasedReturnValue();
    id v20 = [v6 row];
    if (v20 < [(TileGroupSectionsDebugController *)v11 count])
    {
      id v21 = -[TileGroupSectionsDebugController objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", [v6 row]);
      v22 = [v21 objectForKeyedSubscript:GEOActiveTileGroupOverrideStyleKey];
      unsigned int v31 = [v22 intValue];

      id v23 = [v21 objectForKeyedSubscript:GEOActiveTileGroupOverrideSizeKey];
      id v24 = [v23 intValue];

      id v25 = [v21 objectForKeyedSubscript:GEOActiveTileGroupOverrideScaleKey];
      id v26 = [v25 intValue];

      id v27 = [v21 objectForKeyedSubscript:GEOActiveTileGroupOverrideVersionKey];
      id v28 = [v27 unsignedIntValue];

      v29 = [v21 objectForKeyedSubscript:GEOActiveTileGroupOverrideBaseURLKey];
      v30 = [v21 objectForKeyedSubscript:GEOActiveTileGroupOverrideLocalizationURLKey];
      [(TileSetOverrideDebugController *)v8 setStyle:v31];
      [(TileSetOverrideDebugController *)v8 setSize:v24];
      [(TileSetOverrideDebugController *)v8 setScale:v26];
      [(TileSetOverrideDebugController *)v8 setVersion:v28];
      [(TileSetOverrideDebugController *)v8 setBaseURL:v29];
      [(TileSetOverrideDebugController *)v8 setLocalizationURL:v30];
    }
    id v15 = [(ActiveTileGroupDebugController *)self navigationController];
    v16 = v15;
    id v17 = (TileGroupSectionsDebugController *)v8;
  }
  else
  {
    if (v7) {
      goto LABEL_10;
    }
    id v8 = [v32 cellForRowAtIndexPath:v6];
    v9 = [TileGroupSectionsDebugController alloc];
    v10 = [(ActiveTileGroupDebugController *)self tableView];
    objc_super v11 = -[TileGroupSectionsDebugController initWithStyle:](v9, "initWithStyle:", [v10 style]);

    [(TileGroupSectionsDebugController *)v11 setTileGroupIdentifier:[(TileSetOverrideDebugController *)v8 tag]];
    [(TileGroupSectionsDebugController *)v11 setCanChangeActiveTileGroup:self->_canChangeTileGroup];
    [(TileGroupSectionsDebugController *)v11 setResourceManifest:self->_resourceManifest];
    [(TileGroupSectionsDebugController *)v11 setTitle:@"Tile Group Details"];
    id v12 = [(ActiveTileGroupDebugController *)self navigationItem];
    v13 = [v12 rightBarButtonItem];

    if (!v13)
    {
      v14 = [(TileGroupSectionsDebugController *)v11 navigationItem];
      [v14 setRightBarButtonItem:0];
    }
    id v15 = [(ActiveTileGroupDebugController *)self navigationController];
    v16 = v15;
    id v17 = v11;
  }
  [v15 pushViewController:v17 animated:1];

LABEL_10:
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return &stru_101324E70;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManifestError, 0);

  objc_storeStrong((id *)&self->_resourceManifest, 0);
}

@end