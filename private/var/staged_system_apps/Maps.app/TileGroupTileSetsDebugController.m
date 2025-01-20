@interface TileGroupTileSetsDebugController
+ (id)navigationDestinationTitle;
- (GEOResourceManifestDownload)resourceManifest;
- (id)_tileGroup;
- (id)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tileGroupIdentifier;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResourceManifest:(id)a3;
- (void)setTileGroupIdentifier:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation TileGroupTileSetsDebugController

+ (id)navigationDestinationTitle
{
  return @"Tile Sets";
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v3 = [(TileGroupTileSetsDebugController *)self tableView];
  [v3 reloadData];
}

- (id)_tileGroup
{
  id v3 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  if (![v3 tileGroupsCount])
  {
LABEL_12:
    id v11 = 0;
    goto LABEL_15;
  }
  if ([(TileGroupTileSetsDebugController *)self tileGroupIdentifier] != -1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = [v3 tileGroups];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          unsigned int v10 = [v9 identifier];
          if ((id)[(TileGroupTileSetsDebugController *)self tileGroupIdentifier] == (id)v10)
          {
            id v11 = v9;

            goto LABEL_15;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    goto LABEL_12;
  }
  id v11 = [v3 tileGroupAtIndex:0];
LABEL_15:

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(TileGroupTileSetsDebugController *)self _tileGroup];
  id v4 = [v3 tileSetsCount];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TileGroupTileSetsDebugController *)self _tileGroup];
  if ((uint64_t)[v7 row] > 5)
  {
    id v9 = 0;
    goto LABEL_29;
  }
  if ([v7 row] == (id)4 || objc_msgSend(v7, "row") == (id)5)
  {
    id v9 = [v6 dequeueReusableCellWithIdentifier:@"TileSetInfoWithSubtitleCell"];
    if (v9) {
      goto LABEL_10;
    }
    id v10 = objc_alloc((Class)UITableViewCell);
    CFStringRef v11 = @"TileSetInfoWithSubtitleCell";
    uint64_t v12 = 3;
  }
  else
  {
    id v9 = [v6 dequeueReusableCellWithIdentifier:@"TileSetInfoCell"];
    if (v9) {
      goto LABEL_10;
    }
    id v10 = objc_alloc((Class)UITableViewCell);
    CFStringRef v11 = @"TileSetInfoCell";
    uint64_t v12 = 1;
  }
  id v9 = [v10 initWithStyle:v12 reuseIdentifier:v11];
LABEL_10:
  long long v13 = (unsigned int *)[v8 tileSets];
  id v14 = [v7 section];
  long long v15 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  long long v16 = [v15 tileSetAtIndex:v13[2 * (void)v14 + 1]];

  switch((unint64_t)[v7 row])
  {
    case 0uLL:
      v17 = [v9 textLabel];
      [v17 setText:@"Style"];

      id v18 = [v16 style];
      v19 = @"RASTER_STANDARD";
      switch((int)v18)
      {
        case 0:
          goto LABEL_24;
        case 1:
          v19 = @"VECTOR_STANDARD";
          break;
        case 2:
          v19 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
          break;
        case 3:
          v19 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
          break;
        case 4:
          v19 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
          break;
        case 5:
          v19 = @"RASTER_STANDARD_BACKGROUND";
          break;
        case 6:
          v19 = @"RASTER_HYBRID";
          break;
        case 7:
          v19 = @"RASTER_SATELLITE";
          break;
        case 8:
          v19 = @"RASTER_TERRAIN";
          break;
        case 11:
          v19 = @"VECTOR_BUILDINGS";
          break;
        case 12:
          v19 = @"VECTOR_TRAFFIC";
          break;
        case 13:
          v19 = @"VECTOR_POI";
          break;
        case 14:
          v19 = @"SPUTNIK_METADATA";
          break;
        case 15:
          v19 = @"SPUTNIK_C3M";
          break;
        case 16:
          v19 = @"SPUTNIK_DSM";
          break;
        case 17:
          v19 = @"SPUTNIK_DSM_GLOBAL";
          break;
        case 18:
          v19 = @"VECTOR_REALISTIC";
          break;
        case 19:
          v19 = @"VECTOR_LEGACY_REALISTIC";
          break;
        case 20:
          v19 = @"VECTOR_ROADS";
          break;
        case 21:
          v19 = @"RASTER_VEGETATION";
          break;
        case 22:
          v19 = @"VECTOR_TRAFFIC_SKELETON";
          break;
        case 23:
          v19 = @"RASTER_COASTLINE_MASK";
          break;
        case 24:
          v19 = @"RASTER_HILLSHADE";
          break;
        case 25:
          v19 = @"VECTOR_TRAFFIC_WITH_GREEN";
          break;
        case 26:
          v19 = @"VECTOR_TRAFFIC_STATIC";
          break;
        case 27:
          v19 = @"RASTER_COASTLINE_DROP_MASK";
          break;
        case 28:
          v19 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
          break;
        case 29:
          v19 = @"VECTOR_SPEED_PROFILES";
          break;
        case 30:
          v19 = @"VECTOR_VENUES";
          break;
        case 31:
          v19 = @"RASTER_DOWN_SAMPLED";
          break;
        case 32:
          v19 = @"RASTER_COLOR_BALANCED";
          break;
        case 33:
          v19 = @"RASTER_SATELLITE_NIGHT";
          break;
        case 34:
          v19 = @"SPUTNIK_VECTOR_BORDER";
          break;
        case 35:
          v19 = @"RASTER_SATELLITE_DIGITIZE";
          break;
        case 36:
          v19 = @"RASTER_HILLSHADE_PARKS";
          break;
        case 37:
          v19 = @"VECTOR_TRANSIT";
          break;
        case 38:
          v19 = @"RASTER_STANDARD_BASE";
          break;
        case 39:
          v19 = @"RASTER_STANDARD_LABELS";
          break;
        case 40:
          v19 = @"RASTER_HYBRID_ROADS";
          break;
        case 41:
          v19 = @"RASTER_HYBRID_LABELS";
          break;
        case 42:
          v19 = @"FLYOVER_C3M_MESH";
          break;
        case 43:
          v19 = @"FLYOVER_C3M_JPEG_TEXTURE";
          break;
        case 44:
          v19 = @"FLYOVER_C3M_ASTC_TEXTURE";
          break;
        case 45:
          v19 = @"RASTER_SATELLITE_ASTC";
          break;
        case 46:
          v19 = @"RASTER_HYBRID_ROADS_AND_LABELS";
          break;
        case 47:
          v19 = @"VECTOR_TRANSIT_SELECTION";
          break;
        case 48:
          v19 = @"VECTOR_COVERAGE";
          break;
        case 52:
          v19 = @"FLYOVER_METADATA";
          break;
        case 53:
          v19 = @"VECTOR_ROAD_NETWORK";
          break;
        case 54:
          v19 = @"VECTOR_LAND_COVER";
          break;
        case 55:
          v19 = @"VECTOR_DEBUG";
          break;
        case 56:
          v19 = @"VECTOR_STREET_POI";
          break;
        case 57:
          v19 = @"MUNIN_METADATA";
          break;
        case 58:
          v19 = @"VECTOR_SPR_MERCATOR";
          break;
        case 59:
          v19 = @"VECTOR_SPR_MODELS";
          break;
        case 60:
          v19 = @"VECTOR_SPR_MATERIALS";
          break;
        case 61:
          v19 = @"VECTOR_SPR_METADATA";
          break;
        case 62:
          v19 = @"VECTOR_TRACKS";
          break;
        case 63:
          v19 = @"VECTOR_RESERVED_2";
          break;
        case 64:
          v19 = @"VECTOR_STREET_LANDMARKS";
          break;
        case 65:
          v19 = @"COARSE_LOCATION_POLYGONS";
          break;
        case 66:
          v19 = @"VECTOR_SPR_ROADS";
          break;
        case 67:
          v19 = @"VECTOR_SPR_STANDARD";
          break;
        case 68:
          v19 = @"VECTOR_POI_V2";
          break;
        case 69:
          v19 = @"VECTOR_POLYGON_SELECTION";
          break;
        case 70:
          v19 = @"VL_METADATA";
          break;
        case 71:
          v19 = @"VL_DATA";
          break;
        case 72:
          v19 = @"PROACTIVE_APP_CLIP";
          break;
        case 73:
          v19 = @"VECTOR_BUILDINGS_V2";
          break;
        case 74:
          v19 = @"POI_BUSYNESS";
          break;
        case 75:
          v19 = @"POI_DP_BUSYNESS";
          break;
        case 76:
          v19 = @"SMART_INTERFACE_SELECTION";
          break;
        case 77:
          v19 = @"VECTOR_ASSETS";
          break;
        case 78:
          v19 = @"SPR_ASSET_METADATA";
          break;
        case 79:
          v19 = @"VECTOR_SPR_POLAR";
          break;
        case 80:
          v19 = @"SMART_DATA_MODE";
          break;
        case 81:
          v19 = @"CELLULAR_PERFORMANCE_SCORE";
          break;
        case 82:
          v19 = @"VECTOR_SPR_MODELS_OCCLUSION";
          break;
        case 83:
          v19 = @"VECTOR_TOPOGRAPHIC";
          break;
        case 84:
          v19 = @"VECTOR_POI_V2_UPDATE";
          break;
        case 85:
          v19 = @"VECTOR_LIVE_DATA_UPDATES";
          break;
        case 86:
          v19 = @"VECTOR_TRAFFIC_V2";
          break;
        case 87:
          v19 = @"VECTOR_ROAD_SELECTION";
          break;
        case 88:
          v19 = @"VECTOR_REGION_METADATA";
          break;
        case 89:
          v19 = @"RAY_TRACING";
          break;
        case 90:
          v19 = @"VECTOR_CONTOURS";
          break;
        case 91:
          v19 = @"RASTER_SATELLITE_POLAR";
          break;
        case 92:
          v19 = @"VMAP4_ELEVATION";
          break;
        case 93:
          v19 = @"VMAP4_ELEVATION_POLAR";
          break;
        case 94:
          v19 = @"CELLULAR_COVERAGE_PLMN";
          break;
        case 95:
          v19 = @"RASTER_SATELLITE_POLAR_NIGHT";
          break;
        case 96:
          v19 = @"UNUSED_96";
          break;
        case 97:
          v19 = @"UNUSED_97";
          break;
        case 98:
          v19 = @"UNUSED_98";
          break;
        case 99:
          v19 = @"UNUSED_99";
          break;
        case 100:
          v19 = @"UNUSED_100";
          break;
        case 101:
          v19 = @"UNUSED_101";
          break;
        case 102:
          v19 = @"UNUSED_102";
          break;
        case 103:
          v19 = @"UNUSED_103";
          break;
        case 104:
          v19 = @"UNUSED_104";
          break;
        case 105:
          v19 = @"UNUSED_105";
          break;
        case 106:
          v19 = @"UNUSED_106";
          break;
        case 107:
          v19 = @"UNUSED_107";
          break;
        case 108:
          v19 = @"UNUSED_108";
          break;
        case 109:
          v19 = @"UNUSED_109";
          break;
        case 110:
          v19 = @"UNUSED_110";
          break;
        case 111:
          v19 = @"UNUSED_111";
          break;
        case 112:
          v19 = @"UNUSED_112";
          break;
        case 113:
          v19 = @"UNUSED_113";
          break;
        case 114:
          v19 = @"UNUSED_114";
          break;
        case 115:
          v19 = @"UNUSED_115";
          break;
        case 116:
          v19 = @"UNUSED_116";
          break;
        case 117:
          v19 = @"UNUSED_117";
          break;
        case 118:
          v19 = @"UNUSED_118";
          break;
        case 119:
          v19 = @"UNUSED_119";
          break;
        default:
          goto LABEL_18;
      }
      goto LABEL_24;
    case 1uLL:
      v20 = [v9 textLabel];
      [v20 setText:@"Size"];

      id v18 = [v16 size];
      if (v18 >= 3) {
        goto LABEL_18;
      }
      v21 = &off_1012F73C8;
      goto LABEL_17;
    case 2uLL:
      v22 = [v9 textLabel];
      [v22 setText:@"Scale"];

      id v18 = [v16 scale];
      if (v18 >= 3)
      {
LABEL_18:
        +[NSString stringWithFormat:@"(unknown: %i)", v18];
        uint64_t v25 = LABEL_20:;
LABEL_23:
        v19 = (__CFString *)v25;
      }
      else
      {
        v21 = &off_1012F73E0;
LABEL_17:
        v19 = v21[(int)v18];
      }
LABEL_24:
      v28 = [v9 detailTextLabel];
      [v28 setText:v19];

LABEL_25:
      v29 = [v9 detailTextLabel];
      v30 = [v29 text];
      if ([v30 length]) {
        +[UIColor labelColor];
      }
      else {
      v31 = +[UIColor secondaryLabelColor];
      }
      v32 = [v9 textLabel];
      [v32 setTextColor:v31];

      break;
    case 3uLL:
      uint64_t v23 = 2 * (void)v14;
      v24 = [v9 textLabel];
      [v24 setText:@"Version"];

      +[NSString stringWithFormat:@"%i", v13[v23]];
      goto LABEL_20;
    case 4uLL:
      v26 = [v9 textLabel];
      [v26 setText:@"Base URL"];

      uint64_t v25 = [v16 baseURL];
      goto LABEL_23;
    case 5uLL:
      v27 = [v9 textLabel];
      [v27 setText:@"Localization URL"];

      uint64_t v25 = [v16 localizationURL];
      goto LABEL_23;
    default:
      goto LABEL_25;
  }
LABEL_29:

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return &stru_101324E70;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return &stru_101324E70;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)tileGroupIdentifier
{
  return self->tileGroupIdentifier;
}

- (void)setTileGroupIdentifier:(int64_t)a3
{
  self->tileGroupIdentifier = a3;
}

- (GEOResourceManifestDownload)resourceManifest
{
  return self->_resourceManifest;
}

- (void)setResourceManifest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManifest, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end