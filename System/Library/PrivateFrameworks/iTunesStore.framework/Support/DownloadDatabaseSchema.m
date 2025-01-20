@interface DownloadDatabaseSchema
+ (BOOL)_migrateToCurrentUserVersionUsingDatabase:(id)a3;
+ (id)databasePath;
+ (void)createFunctionsInDatabase:(id)a3;
+ (void)createSchemaInDatabase:(id)a3;
@end

@implementation DownloadDatabaseSchema

+ (void)createFunctionsInDatabase:(id)a3
{
}

+ (void)createSchemaInDatabase:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EFF80;
  v5[3] = &unk_1003A6378;
  v5[4] = &v6;
  objc_msgSend(a3, "prepareStatementForSQL:cache:usingBlock:", @"SELECT name FROM sqlite_master WHERE name='download';",
    0,
    v5);
  [a3 executeSQL:@"PRAGMA legacy_file_format = 0;"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS application_id (effective_client_id INTEGER, bundle_id TEXT NOT NULL, UNIQUE (bundle_id))"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS asset (pid INTEGER, download_id INTEGER, asset_order INTEGER DEFAULT 0, asset_type TEXT, bytes_total INTEGER, url TEXT, local_path TEXT, destination_url TEXT, path_extension TEXT, retry_count INTEGER, http_method TEXT, initial_odr_size INTEGER, is_discretionary INTEGER DEFAULT 0, is_downloaded INTEGER DEFAULT 0, is_drm_free INTEGER DEFAULT 0, is_external INTEGER DEFAULT 0, is_hls INTEGER DEFAULT 0, is_local_cache_server INTEGER DEFAULT 0, is_zip_streamable INTEGER DEFAULT 0, processing_types INTEGER DEFAULT 0, video_dimensions TEXT, timeout_interval REAL, store_flavor TEXT, download_token INTEGER DEFAULT 0, blocked_reason INTEGER DEFAULT 0, avfoundation_blocked INTEGER DEFAULT 0, service_type INTEGER DEFAULT 0, protection_type INTEGER DEFAULT 0,store_download_key TEXT, etag TEXT, bytes_to_hash INTEGER, hash_type INTEGER DEFAULT 0, server_guid TEXT, file_protection TEXT, variant_id TEXT, hash_array BLOB, http_headers BLOB, request_parameters BLOB, body_data BLOB, body_data_file_path TEXT,sinfs_data BLOB, dpinfo_data BLOB, uncompressed_size INTEGER DEFAULT 0, url_session_task_id INTEGER DEFAULT -1, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS download (pid INTEGER, airplay_content_type TEXT, artist_name TEXT, artwork_is_prerendered INTEGER DEFAULT 0, artwork_template_name TEXT, auto_update_time INTEGER, beta_external_version_identifier INTEGER DEFAULT 0, bundle_id TEXT, bundle_version TEXT, cancel_if_duplicate INTEGER DEFAULT 0, cancel_on_failure INTEGER DEFAULT 0, cancel_url TEXT, client_id TEXT, collection_artist_name TEXT, collection_group_count INTEGER, collection_item_count INTEGER, collection_name TEXT, composer_name TEXT, diverted_job_id INTEGER, document_target_id TEXT, download_permalink TEXT, duet_transfer_type INTEGER DEFAULT 0, duration_in_ms INTEGER DEFAULT 0, effective_client_id INTEGER DEFAULT 0, enable_extensions INTEGER DEFAULT 0, episode_id TEXT, episode_sort_id INTEGER, handler_id INTEGER DEFAULT 0, has_4k INTEGER DEFAULT 0, has_dolby_vision INTEGER DEFAULT 0, has_hdr INTEGER DEFAULT 0, has_messages_extension INTEGER DEFAULT 0, hls_playlist_url TEXT, genre_name TEXT, index_in_collection INTEGER DEFAULT 0, index_in_collection_group INTEGER, is_automatic INTEGER DEFAULT 0, is_compilation INTEGER DEFAULT 0, is_device_based_vpp INTEGER DEFAULT 0, is_diverted INTEGER DEFAULT 0, is_explicit INTEGER DEFAULT 0, is_from_store INTEGER DEFAULT 0, is_hd INTEGER DEFAULT 0, is_hls INTEGER DEFAULT 0, is_premium INTEGER DEFAULT 0, is_private INTEGER DEFAULT 0, is_purchase INTEGER DEFAULT 0, is_redownload INTEGER DEFAULT 0, is_restore INTEGER DEFAULT 0, is_rental INTEGER DEFAULT 0, is_sample INTEGER DEFAULT 0, is_shared INTEGER DEFAULT 0, is_store_queued INTEGER DEFAULT 0, is_tv_template INTEGER DEFAULT 0, is_music_show INTEGER DEFAULT 0, kind TEXT, launch_prohibited INTEGER DEFAULT 0, library_id TEXT, loading_priority REAL, long_description TEXT, long_season_description TEXT, messages_artwork_url TEXT, network_name TEXT, order_key DOUBLE DEFAULT 0, order_seed INTEGER DEFAULT 0, override_audit_token_data BLOB, page_progression_direction TEXT, podcast_episode_guid TEXT, podcast_feed_url TEXT, podcast_type TEXT, policy_id INTEGER DEFAULT 0, priority INTEGER DEFAULT 0, preferred_asset_flavor TEXT, purchase_id INTEGER DEFAULT 0, rate_limit INTEGER, reason INTEGER DEFAULT 0,ref_app TEXT, ref_url TEXT, release_date INTEGER, release_year INTEGER, rental_id INTEGER, resource_timeout_interval REAL, season_number INTEGER, series_name TEXT, software_type TEXT, short_description TEXT, show_composer INTEGER DEFAULT 0, suppress_error_dialogs INTEGER NOT NULL DEFAULT 0, store_account_id INTEGER, store_account_name TEXT, store_artist_id INTEGER, store_cohort TEXT, store_collection_id INTEGER, store_composer_id INTEGER, store_download_key TEXT, store_front_id TEXT, store_genre_id INTEGER, store_item_id INTEGER, store_match_status INTEGER NOT NULL DEFAULT 0, store_publication_version INTEGER DEFAULT 0, store_preorder_id INTEGER, store_purchase_date INTEGER, store_redownload_parameters TEXT, store_redownload_status INTEGER NOT NULL DEFAULT 0, store_saga_id INTEGER, store_software_version_id INTEGER, store_transaction_id TEXT, store_url TEXT, store_xid TEXT, thumbnail_newsstand_binding_edge TEXT, thumbnail_newsstand_binding_type TEXT, thumbnail_url TEXT, timeout_interval REAL, timestamp INTEGER DEFAULT (strftime('%s', 'now')), title TEXT, transaction_id INTEGER DEFAULT 0, variant_id TEXT, work_name TEXT, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS download_policy (pid INTEGER, policy_data BLOB, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS download_state (pid INTEGER, download_id INTEGER, phase TEXT, is_restricted INTEGER DEFAULT 0, restore_state INTEGER DEFAULT 0, blocked_reason INTEGER NOT NULL DEFAULT 0, can_pause INTEGER DEFAULT 1, can_cancel INTEGER DEFAULT 1, can_prioritize INTEGER DEFAULT 1, is_server_finished INTEGER DEFAULT 0, has_restore_data INTEGER DEFAULT -1, last_odr_action INTEGER DEFAULT 0, restore_data_size INTEGER DEFAULT 0, store_queue_refresh_count INTEGER DEFAULT 0, did_restore_data INTEGER DEFAULT 0, auto_update_state INTEGER NOT NULL DEFAULT 0, download_error BLOB, restore_error BLOB, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS finished_download (pid INTEGER, finish_url TEXT, store_account_id INTEGER NOT NULL, store_item_id INTEGER, store_transaction_id TEXT, PRIMARY KEY(pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS persistent_download (download_id INTEGER, manager_id INTEGER, PRIMARY KEY (download_id, manager_id));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS persistent_manager (pid INTEGER, client_id TEXT, filters_external_downloads INTEGER DEFAULT 0, migration_version INTEGER DEFAULT 0, wake_up_on_finish INTEGER DEFAULT 0, persistence_id TEXT, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS persistent_manager_kind (pid INTEGER, manager_id INTEGER, download_kind TEXT, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS preorder (pid INTEGER, artist_name TEXT, kind TEXT, release_date INTEGER, release_date_string TEXT, store_account_id INTEGER, store_item_id INTEGER, store_preorder_id INTEGER, title TEXT, image_collection_data BLOB, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS canceled_preorder (pid INTEGER, store_account_id INTEGER NOT NULL DEFAULT 0, store_item_id INTEGER NOT NULL DEFAULT 0, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS client (pid INTEGER, audit_token_data BLOB, client_type INTEGER DEFAULT 0, client_id TEXT NOT NULL, PRIMARY KEY (pid), UNIQUE (client_id));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS purchase (pid INTEGER, batch_id INTEGER DEFAULT 0, client_id INTEGER DEFAULT 0, order_id DOUBLE DEFAULT 0, state INTEGER DEFAULT 0, encoded_data BLOB, encoded_error BLOB, encoded_response BLOB, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS purchase_manager (pid INTEGER, client_id_header TEXT, manager_id TEXT, process_id TEXT, url_bag_type TEXT, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS application_workspace_state (pid INTEGER, bundle_id TEXT NOT NULL, download_id INTEGER, expected_phase TEXT NOT NULL DEFAULT 0, retry_count INTEGER NOT NULL DEFAULT 0, time_updated INTEGER NOT NULL DEFAULT 0, transaction_id INTEGER, PRIMARY KEY (pid), UNIQUE (bundle_id));"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS application_workspace_state_bundle_id ON application_workspace_state (bundle_id);"];
  [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS trnsaction (pid INTEGER, bundle_id TEXT, type INTEGER DEFAULT 0, PRIMARY KEY (pid));"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS asset_download_id ON asset (download_id);"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS download_priority_order_key ON download (priority DESC, order_key ASC);"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS download_is_restore ON download (is_restore);"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS download_kind ON download (kind);"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS preorder_preorder_id ON preorder (store_preorder_id);"];
  if (*((unsigned char *)v7 + 24))
  {
    [a1 _migrateToCurrentUserVersionUsingDatabase:a3];
  }
  else
  {
    sub_1000EFFBC(a3);
    [a3 setUserVersion:13000];
  }
  _Block_object_dispose(&v6, 8);
}

+ (id)databasePath
{
  id v2 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CPSharedResourcesDirectory(), @"Media", @"Downloads", @"downloads.28.sqlitedb", 0);
  v3 = +[NSString pathWithComponents:v2];

  return v3;
}

+ (BOOL)_migrateToCurrentUserVersionUsingDatabase:(id)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000F0C5C;
  v24[3] = &unk_1003A6378;
  v24[4] = &v25;
  [a3 prepareStatementForSQL:@"PRAGMA user_version;" cache:0 usingBlock:v24];
  do
  {
    int v4 = *((_DWORD *)v26 + 6);
    unsigned int v5 = v4 >> 3;
    if (v4 >> 3 > 0x658) {
      goto LABEL_120;
    }
    if (v4 > 7099)
    {
      if (v4 > 9299)
      {
        if (v4 > 10099)
        {
          if (v4 > 10999)
          {
            if (v4 == 11000)
            {
              v7 = (id (*)(void *, const char *))sub_1000F2B48;
            }
            else
            {
              if (v4 != 11200)
              {
LABEL_121:
                id v17 = +[SSLogConfig sharedDaemonConfig];
                if (!v17) {
                  id v17 = +[SSLogConfig sharedConfig];
                }
                unsigned int v18 = [v17 shouldLog];
                unsigned int v19 = [v17 shouldLogToDisk];
                v20 = [v17 OSLogObject];
                if (v19) {
                  v18 |= 2u;
                }
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                  int v21 = v18;
                }
                else {
                  int v21 = v18 & 2;
                }
                if (v21)
                {
                  int v22 = *((_DWORD *)v26 + 6);
                  int v29 = 67109376;
                  int v30 = v22;
                  __int16 v31 = 1024;
                  int v32 = 13000;
                  LODWORD(v23) = 14;
                  uint64_t v14 = _os_log_send_and_compose_impl();
                  if (v14) {
                    goto LABEL_119;
                  }
                }
                goto LABEL_120;
              }
              v7 = (id (*)(void *, const char *))sub_1000F2BA8;
            }
          }
          else if (v4 == 10100)
          {
            v7 = (id (*)(void *, const char *))sub_1000F2A58;
          }
          else
          {
            if (v4 != 10300) {
              goto LABEL_121;
            }
            v7 = (id (*)(void *, const char *))sub_1000F2AC8;
          }
        }
        else
        {
          if (v4 > 9999)
          {
            switch(v4)
            {
              case 10000:
                v7 = (id (*)(void *, const char *))sub_1000F2868;
                goto LABEL_108;
              case 10001:
                v7 = (id (*)(void *, const char *))sub_1000F28C8;
                goto LABEL_108;
              case 10002:
                v7 = (id (*)(void *, const char *))sub_1000F2938;
                goto LABEL_108;
              case 10003:
                v7 = (id (*)(void *, const char *))sub_1000F2988;
                goto LABEL_108;
              case 10004:
                v7 = (id (*)(void *, const char *))sub_1000F29D8;
                goto LABEL_108;
              default:
                goto LABEL_121;
            }
          }
          switch(v4)
          {
            case 9300:
              v7 = (id (*)(void *, const char *))sub_1000F2748;
              break;
            case 9301:
              v7 = (id (*)(void *, const char *))sub_1000F27A8;
              break;
            case 9302:
              v7 = (id (*)(void *, const char *))sub_1000F2808;
              break;
            default:
              goto LABEL_121;
          }
        }
      }
      else
      {
        if (v4 > 8999)
        {
          switch(v4)
          {
            case 9000:
              v7 = (id (*)(void *, const char *))sub_1000F2490;
              goto LABEL_108;
            case 9001:
              v7 = (id (*)(void *, const char *))sub_1000F2520;
              goto LABEL_108;
            case 9002:
              v7 = (id (*)(void *, const char *))sub_1000F2524;
              goto LABEL_108;
            case 9003:
              v7 = (id (*)(void *, const char *))sub_1000F2528;
              goto LABEL_108;
            case 9004:
              v7 = (id (*)(void *, const char *))sub_1000F2598;
              goto LABEL_108;
            case 9005:
              v7 = (id (*)(void *, const char *))sub_1000F25F8;
              goto LABEL_108;
            case 9006:
              v7 = (id (*)(void *, const char *))sub_1000F2648;
              goto LABEL_108;
            case 9007:
              v7 = (id (*)(void *, const char *))sub_1000F2698;
              goto LABEL_108;
            case 9008:
              v7 = (id (*)(void *, const char *))sub_1000F26F8;
              goto LABEL_108;
            default:
              goto LABEL_121;
          }
        }
        switch(v4)
        {
          case 8000:
            v7 = (id (*)(void *, const char *))sub_1000F20EC;
            break;
          case 8001:
            v7 = (id (*)(void *, const char *))sub_1000F213C;
            break;
          case 8002:
            v7 = (id (*)(void *, const char *))sub_1000F218C;
            break;
          case 8003:
            v7 = (id (*)(void *, const char *))sub_1000F21DC;
            break;
          case 8004:
            v7 = (id (*)(void *, const char *))sub_1000F222C;
            break;
          case 8005:
            v7 = (id (*)(void *, const char *))sub_1000F227C;
            break;
          case 8006:
            v7 = (id (*)(void *, const char *))sub_1000F22CC;
            break;
          default:
            switch(v4)
            {
              case 8300:
                v7 = (id (*)(void *, const char *))sub_1000F232C;
                goto LABEL_108;
              case 8301:
                v7 = (id (*)(void *, const char *))sub_1000F237C;
                goto LABEL_108;
              case 8302:
                v7 = (id (*)(void *, const char *))sub_1000F23F0;
                goto LABEL_108;
              case 8303:
                v7 = (id (*)(void *, const char *))sub_1000F2440;
                goto LABEL_108;
              default:
                if (v4 != 7100) {
                  goto LABEL_121;
                }
                v7 = (id (*)(void *, const char *))sub_1000F209C;
                break;
            }
            break;
        }
      }
    }
    else if (v4 > 6099)
    {
      switch(v4)
      {
        case 7000:
          v7 = (id (*)(void *, const char *))sub_1000F1B14;
          break;
        case 7001:
          v7 = (id (*)(void *, const char *))sub_1000F1B64;
          break;
        case 7002:
          v7 = (id (*)(void *, const char *))sub_1000F1BB4;
          break;
        case 7003:
          v7 = (id (*)(void *, const char *))sub_1000F1C14;
          break;
        case 7004:
          v7 = (id (*)(void *, const char *))sub_1000F1C64;
          break;
        case 7005:
          v7 = (id (*)(void *, const char *))sub_1000F1CC4;
          break;
        case 7006:
          v7 = (id (*)(void *, const char *))sub_1000F1D14;
          break;
        case 7007:
          v7 = (id (*)(void *, const char *))sub_1000F1D64;
          break;
        case 7008:
          v7 = (id (*)(void *, const char *))sub_1000F1DB4;
          break;
        case 7009:
          v7 = (id (*)(void *, const char *))sub_1000F1E14;
          break;
        case 7010:
          v7 = (id (*)(void *, const char *))sub_1000F1E64;
          break;
        case 7011:
          v7 = (id (*)(void *, const char *))sub_1000F1EC4;
          break;
        case 7012:
          v7 = (id (*)(void *, const char *))sub_1000F1F5C;
          break;
        case 7013:
          v7 = (id (*)(void *, const char *))sub_1000F1FAC;
          break;
        case 7014:
          v7 = (id (*)(void *, const char *))sub_1000F1FFC;
          break;
        case 7015:
          v7 = (id (*)(void *, const char *))sub_1000F204C;
          break;
        default:
          if (v4 != 6100) {
            goto LABEL_121;
          }
          v7 = (id (*)(void *, const char *))sub_1000F1AA4;
          break;
      }
    }
    else if (v4 > 5100)
    {
      switch(v4)
      {
        case 6000:
          v7 = (id (*)(void *, const char *))sub_1000F1170;
          break;
        case 6001:
          v7 = (id (*)(void *, const char *))sub_1000F1624;
          break;
        case 6002:
          v7 = (id (*)(void *, const char *))sub_1000F1674;
          break;
        case 6003:
          v7 = (id (*)(void *, const char *))sub_1000F16C4;
          break;
        case 6004:
          v7 = (id (*)(void *, const char *))sub_1000F1714;
          break;
        case 6005:
          v7 = (id (*)(void *, const char *))sub_1000F1764;
          break;
        case 6006:
          v7 = (id (*)(void *, const char *))sub_1000F17C4;
          break;
        case 6007:
          v7 = (id (*)(void *, const char *))sub_1000F1814;
          break;
        case 6008:
          v7 = (id (*)(void *, const char *))sub_1000F1864;
          break;
        case 6009:
          v7 = (id (*)(void *, const char *))sub_1000F18B4;
          break;
        case 6010:
          v7 = (id (*)(void *, const char *))sub_1000F1904;
          break;
        case 6011:
          v7 = (id (*)(void *, const char *))sub_1000F1964;
          break;
        case 6012:
          v7 = (id (*)(void *, const char *))sub_1000F19B4;
          break;
        case 6013:
          v7 = (id (*)(void *, const char *))sub_1000F1A04;
          break;
        case 6014:
          v7 = (id (*)(void *, const char *))sub_1000F1A54;
          break;
        default:
          if ((v4 - 5101) >= 2) {
            goto LABEL_121;
          }
          v7 = (id (*)(void *, const char *))sub_1000F1120;
          break;
      }
    }
    else
    {
      uint64_t v6 = sub_1000F0CE0;
      switch(v4)
      {
        case 5000:
          v7 = (id (*)(void *, const char *))sub_1000F0CF0;
          break;
        case 5001:
          v7 = (id (*)(void *, const char *))sub_1000F0D40;
          break;
        case 5002:
          v7 = (id (*)(void *, const char *))sub_1000F0D90;
          break;
        case 5003:
          v7 = (id (*)(void *, const char *))sub_1000F0DE0;
          break;
        case 5004:
          v7 = (id (*)(void *, const char *))sub_1000F0E40;
          break;
        case 5005:
          v7 = (id (*)(void *, const char *))sub_1000F0E90;
          break;
        case 5006:
          v7 = (id (*)(void *, const char *))sub_1000F0EE0;
          break;
        case 5007:
          v7 = (id (*)(void *, const char *))sub_1000F0F40;
          break;
        case 5008:
          v7 = (id (*)(void *, const char *))sub_1000F0F90;
          break;
        case 5009:
          v7 = (id (*)(void *, const char *))sub_1000F0FE0;
          break;
        case 5010:
          v7 = (id (*)(void *, const char *))sub_1000F1030;
          break;
        default:
          if (!v4) {
            continue;
          }
          if (v4 != 5100) {
            goto LABEL_121;
          }
          v7 = (id (*)(void *, const char *))sub_1000F10D0;
          break;
      }
    }
LABEL_108:
    uint64_t v6 = v7;
  }
  while (((uint64_t)v6(a3, (const char *)v26 + 24) & 1) != 0);
  id v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8) {
    id v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  unsigned int v10 = [v8 shouldLogToDisk];
  v11 = [v8 OSLogObject];
  if (v10) {
    v9 |= 2u;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    int v12 = v9;
  }
  else {
    int v12 = v9 & 2;
  }
  if (v12)
  {
    int v13 = *((_DWORD *)v26 + 6);
    int v29 = 67109120;
    int v30 = v13;
    LODWORD(v23) = 8;
    uint64_t v14 = _os_log_send_and_compose_impl();
    if (v14)
    {
LABEL_119:
      v15 = (void *)v14;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v29, v23);
      free(v15);
      SSFileLog();
    }
  }
LABEL_120:
  _Block_object_dispose(&v25, 8);
  return v5 > 0x658;
}

@end