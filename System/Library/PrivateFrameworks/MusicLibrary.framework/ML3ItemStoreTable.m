@interface ML3ItemStoreTable
- (id)columns;
- (id)name;
@end

@implementation ML3ItemStoreTable

- (void).cxx_destruct
{
}

- (id)columns
{
  v68[60] = *MEMORY[0x1E4F143B8];
  columns = self->_columns;
  if (!columns)
  {
    v52 = self;
    v67 = +[ML3DatabaseColumn columnWithName:@"item_pid" datatype:2 constraints:1 defaultValue:0];
    v68[0] = v67;
    v66 = +[ML3DatabaseColumn columnWithName:@"store_item_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[1] = v66;
    v65 = +[ML3DatabaseColumn columnWithName:@"store_composer_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[2] = v65;
    v64 = +[ML3DatabaseColumn columnWithName:@"store_genre_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[3] = v64;
    v63 = +[ML3DatabaseColumn columnWithName:@"store_playlist_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[4] = v63;
    v62 = +[ML3DatabaseColumn columnWithName:@"storefront_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[5] = v62;
    v61 = +[ML3DatabaseColumn columnWithName:@"purchase_history_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[6] = v61;
    v60 = +[ML3DatabaseColumn columnWithName:@"purchase_history_token" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[7] = v60;
    v59 = +[ML3DatabaseColumn columnWithName:@"purchase_history_redownload_params" datatype:4 constraints:0 defaultValue:0];
    v68[8] = v59;
    v58 = +[ML3DatabaseColumn columnWithName:@"store_saga_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[9] = v58;
    v57 = +[ML3DatabaseColumn columnWithName:@"match_redownload_params" datatype:4 constraints:0 defaultValue:0];
    v68[10] = v57;
    v56 = +[ML3DatabaseColumn columnWithName:@"cloud_status" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[11] = v56;
    v55 = +[ML3DatabaseColumn columnWithName:@"sync_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[12] = v55;
    v54 = +[ML3DatabaseColumn columnWithName:@"home_sharing_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[13] = v54;
    v53 = +[ML3DatabaseColumn columnWithName:@"is_ota_purchased" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[14] = v53;
    v51 = +[ML3DatabaseColumn columnWithName:@"store_kind" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[15] = v51;
    v50 = +[ML3DatabaseColumn columnWithName:@"account_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[16] = v50;
    v49 = +[ML3DatabaseColumn columnWithName:@"downloader_account_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[17] = v49;
    v48 = +[ML3DatabaseColumn columnWithName:@"family_account_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[18] = v48;
    v47 = +[ML3DatabaseColumn columnWithName:@"is_protected" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[19] = v47;
    v46 = +[ML3DatabaseColumn columnWithName:@"key_versions" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[20] = v46;
    v45 = +[ML3DatabaseColumn columnWithName:@"key_platform_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[21] = v45;
    v44 = +[ML3DatabaseColumn columnWithName:@"key_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[22] = v44;
    v43 = +[ML3DatabaseColumn columnWithName:@"key_id_2" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[23] = v43;
    v42 = +[ML3DatabaseColumn columnWithName:@"date_purchased" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[24] = v42;
    v41 = +[ML3DatabaseColumn columnWithName:@"date_released" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[25] = v41;
    v40 = +[ML3DatabaseColumn columnWithName:@"external_guid" datatype:4 constraints:0 defaultValue:0];
    v68[26] = v40;
    v39 = +[ML3DatabaseColumn columnWithName:@"feed_url" datatype:4 constraints:0 defaultValue:0];
    v68[27] = v39;
    v38 = +[ML3DatabaseColumn columnWithName:@"artwork_url" datatype:4 constraints:0 defaultValue:0];
    v68[28] = v38;
    v37 = +[ML3DatabaseColumn columnWithName:@"store_xid" datatype:4 constraints:0 defaultValue:0];
    v68[29] = v37;
    v36 = +[ML3DatabaseColumn columnWithName:@"store_flavor" datatype:4 constraints:0 defaultValue:0];
    v68[30] = v36;
    v35 = +[ML3DatabaseColumn columnWithName:@"store_matched_status" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[31] = v35;
    v34 = +[ML3DatabaseColumn columnWithName:@"store_redownloaded_status" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[32] = v34;
    v33 = +[ML3DatabaseColumn columnWithName:@"extras_url" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[33] = v33;
    v32 = +[ML3DatabaseColumn columnWithName:@"vpp_is_licensed" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[34] = v32;
    v31 = +[ML3DatabaseColumn columnWithName:@"vpp_org_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[35] = v31;
    v30 = +[ML3DatabaseColumn columnWithName:@"vpp_org_name" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[36] = v30;
    v29 = +[ML3DatabaseColumn columnWithName:@"sync_redownload_params" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[37] = v29;
    v28 = +[ML3DatabaseColumn columnWithName:@"needs_reporting" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[38] = v28;
    v27 = +[ML3DatabaseColumn columnWithName:@"subscription_store_item_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[39] = v27;
    v26 = +[ML3DatabaseColumn columnWithName:@"playback_endpoint_type" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[40] = v26;
    v25 = +[ML3DatabaseColumn columnWithName:@"is_mastered_for_itunes" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[41] = v25;
    v24 = +[ML3DatabaseColumn columnWithName:@"radio_station_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[42] = v24;
    v23 = +[ML3DatabaseColumn columnWithName:@"advertisement_unique_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[43] = v23;
    v22 = +[ML3DatabaseColumn columnWithName:@"advertisement_type" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[44] = v22;
    v21 = +[ML3DatabaseColumn columnWithName:@"is_artist_uploaded_content" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[45] = v21;
    v20 = +[ML3DatabaseColumn columnWithName:@"cloud_asset_available" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[46] = v20;
    v19 = +[ML3DatabaseColumn columnWithName:@"is_subscription" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[47] = v19;
    v18 = +[ML3DatabaseColumn columnWithName:@"sync_in_my_library" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[48] = v18;
    v17 = +[ML3DatabaseColumn columnWithName:@"cloud_in_my_library" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[49] = v17;
    v16 = +[ML3DatabaseColumn columnWithName:@"cloud_album_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[50] = v16;
    v4 = +[ML3DatabaseColumn columnWithName:@"cloud_playback_endpoint_type" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[51] = v4;
    v5 = +[ML3DatabaseColumn columnWithName:@"cloud_universal_library_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[52] = v5;
    v6 = +[ML3DatabaseColumn columnWithName:@"reporting_store_item_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[53] = v6;
    v7 = +[ML3DatabaseColumn columnWithName:@"asset_store_item_id" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[54] = v7;
    v8 = +[ML3DatabaseColumn columnWithName:@"extended_playback_attribute" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[55] = v8;
    v9 = +[ML3DatabaseColumn columnWithName:@"extended_lyrics_attribute" datatype:2 constraints:16 defaultValue:&unk_1F0911668];
    v68[56] = v9;
    v10 = +[ML3DatabaseColumn columnWithName:@"store_canonical_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[57] = v10;
    v11 = +[ML3DatabaseColumn columnWithName:@"tv_show_canonical_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[58] = v11;
    v12 = +[ML3DatabaseColumn columnWithName:@"tv_season_canonical_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v68[59] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:60];
    v14 = v52->_columns;
    v52->_columns = (NSArray *)v13;

    columns = v52->_columns;
  }

  return columns;
}

- (id)name
{
  return @"item_store";
}

@end