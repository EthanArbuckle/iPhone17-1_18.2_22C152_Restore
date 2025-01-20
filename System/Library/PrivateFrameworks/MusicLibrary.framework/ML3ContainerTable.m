@interface ML3ContainerTable
- (id)columns;
- (id)name;
@end

@implementation ML3ContainerTable

- (void).cxx_destruct
{
}

- (id)columns
{
  v95[87] = *MEMORY[0x1E4F143B8];
  columns = self->_columns;
  if (!columns)
  {
    v72 = self;
    v94 = +[ML3DatabaseColumn columnWithName:@"container_pid" datatype:2 constraints:1 defaultValue:0];
    v95[0] = v94;
    v93 = +[ML3DatabaseColumn columnWithName:@"distinguished_kind" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[1] = v93;
    v92 = +[ML3DatabaseColumn columnWithName:@"date_created" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[2] = v92;
    v91 = +[ML3DatabaseColumn columnWithName:@"date_modified" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[3] = v91;
    v90 = +[ML3DatabaseColumn columnWithName:@"date_played" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[4] = v90;
    v89 = +[ML3DatabaseColumn columnWithName:@"name" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[5] = v89;
    v88 = +[ML3DatabaseColumn columnWithName:@"name_order" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[6] = v88;
    v87 = +[ML3DatabaseColumn columnWithName:@"is_owner" datatype:2 constraints:16 defaultValue:&unk_1F0910F18];
    v95[7] = v87;
    v86 = +[ML3DatabaseColumn columnWithName:@"is_editable" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[8] = v86;
    v85 = +[ML3DatabaseColumn columnWithName:@"parent_pid" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[9] = v85;
    v84 = +[ML3DatabaseColumn columnWithName:@"contained_media_type" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[10] = v84;
    v83 = +[ML3DatabaseColumn columnWithName:@"workout_template_id" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[11] = v83;
    v82 = +[ML3DatabaseColumn columnWithName:@"is_hidden" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[12] = v82;
    v81 = +[ML3DatabaseColumn columnWithName:@"is_ignorable_itunes_playlist" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[13] = v81;
    v80 = +[ML3DatabaseColumn columnWithName:@"description" datatype:4 constraints:0 defaultValue:0];
    v95[14] = v80;
    v79 = +[ML3DatabaseColumn columnWithName:@"play_count_user" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[15] = v79;
    v78 = +[ML3DatabaseColumn columnWithName:@"play_count_recent" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[16] = v78;
    v77 = +[ML3DatabaseColumn columnWithName:@"liked_state" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[17] = v77;
    v76 = +[ML3DatabaseColumn columnWithName:@"smart_evaluation_order" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[18] = v76;
    v75 = +[ML3DatabaseColumn columnWithName:@"smart_is_folder" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[19] = v75;
    v74 = +[ML3DatabaseColumn columnWithName:@"smart_is_dynamic" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[20] = v74;
    v73 = +[ML3DatabaseColumn columnWithName:@"smart_is_filtered" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[21] = v73;
    v71 = +[ML3DatabaseColumn columnWithName:@"smart_is_genius" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[22] = v71;
    v70 = +[ML3DatabaseColumn columnWithName:@"smart_enabled_only" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[23] = v70;
    v69 = +[ML3DatabaseColumn columnWithName:@"smart_is_limited" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[24] = v69;
    v68 = +[ML3DatabaseColumn columnWithName:@"smart_limit_kind" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[25] = v68;
    v67 = +[ML3DatabaseColumn columnWithName:@"smart_limit_order" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[26] = v67;
    v66 = +[ML3DatabaseColumn columnWithName:@"smart_limit_value" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[27] = v66;
    v65 = +[ML3DatabaseColumn columnWithName:@"smart_reverse_limit_order" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[28] = v65;
    v64 = +[ML3DatabaseColumn columnWithName:@"smart_criteria" datatype:5 constraints:0 defaultValue:0];
    v95[29] = v64;
    v63 = +[ML3DatabaseColumn columnWithName:@"play_order" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[30] = v63;
    v62 = +[ML3DatabaseColumn columnWithName:@"is_reversed" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[31] = v62;
    v61 = +[ML3DatabaseColumn columnWithName:@"album_field_order" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[32] = v61;
    v60 = +[ML3DatabaseColumn columnWithName:@"repeat_mode" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[33] = v60;
    v59 = +[ML3DatabaseColumn columnWithName:@"shuffle_items" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[34] = v59;
    v58 = +[ML3DatabaseColumn columnWithName:@"has_been_shuffled" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[35] = v58;
    v57 = +[ML3DatabaseColumn columnWithName:@"filepath" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[36] = v57;
    v56 = +[ML3DatabaseColumn columnWithName:@"is_saveable" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[37] = v56;
    v55 = +[ML3DatabaseColumn columnWithName:@"is_src_remote" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[38] = v55;
    v54 = +[ML3DatabaseColumn columnWithName:@"is_ignored_syncing" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[39] = v54;
    v53 = +[ML3DatabaseColumn columnWithName:@"container_type" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[40] = v53;
    v52 = +[ML3DatabaseColumn columnWithName:@"is_container_type_active_target" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[41] = v52;
    v51 = +[ML3DatabaseColumn columnWithName:@"orig_date_modified" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[42] = v51;
    v50 = +[ML3DatabaseColumn columnWithName:@"store_cloud_id" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[43] = v50;
    v49 = +[ML3DatabaseColumn columnWithName:@"has_cloud_play_order" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[44] = v49;
    v48 = +[ML3DatabaseColumn columnWithName:@"cloud_global_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[45] = v48;
    v47 = +[ML3DatabaseColumn columnWithName:@"cloud_share_url" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[46] = v47;
    v46 = +[ML3DatabaseColumn columnWithName:@"cloud_is_public" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[47] = v46;
    v45 = +[ML3DatabaseColumn columnWithName:@"cloud_is_visible" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[48] = v45;
    v44 = +[ML3DatabaseColumn columnWithName:@"cloud_is_subscribed" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[49] = v44;
    v43 = +[ML3DatabaseColumn columnWithName:@"cloud_is_curator_playlist" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[50] = v43;
    v42 = +[ML3DatabaseColumn columnWithName:@"cloud_author_store_id" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[51] = v42;
    v41 = +[ML3DatabaseColumn columnWithName:@"cloud_author_display_name" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[52] = v41;
    v40 = +[ML3DatabaseColumn columnWithName:@"cloud_author_store_url" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[53] = v40;
    v39 = +[ML3DatabaseColumn columnWithName:@"cloud_min_refresh_interval" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[54] = v39;
    v38 = +[ML3DatabaseColumn columnWithName:@"cloud_last_update_time" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[55] = v38;
    v37 = +[ML3DatabaseColumn columnWithName:@"cloud_user_count" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[56] = v37;
    v36 = +[ML3DatabaseColumn columnWithName:@"cloud_global_play_count" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[57] = v36;
    v35 = +[ML3DatabaseColumn columnWithName:@"cloud_global_like_count" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[58] = v35;
    v34 = +[ML3DatabaseColumn columnWithName:@"keep_local" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[59] = v34;
    v33 = +[ML3DatabaseColumn columnWithName:@"keep_local_status" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[60] = v33;
    v32 = +[ML3DatabaseColumn columnWithName:@"keep_local_status_reason" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[61] = v32;
    v31 = +[ML3DatabaseColumn columnWithName:@"keep_local_constraints" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[62] = v31;
    v30 = +[ML3DatabaseColumn columnWithName:@"external_vendor_identifier" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[63] = v30;
    v29 = +[ML3DatabaseColumn columnWithName:@"external_vendor_display_name" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[64] = v29;
    v28 = +[ML3DatabaseColumn columnWithName:@"external_vendor_container_tag" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[65] = v28;
    v27 = +[ML3DatabaseColumn columnWithName:@"is_external_vendor_playlist" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[66] = v27;
    v26 = +[ML3DatabaseColumn columnWithName:@"sync_id" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[67] = v26;
    v25 = +[ML3DatabaseColumn columnWithName:@"cloud_is_sharing_disabled" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[68] = v25;
    v24 = +[ML3DatabaseColumn columnWithName:@"cloud_version_hash" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[69] = v24;
    v23 = +[ML3DatabaseColumn columnWithName:@"date_played_local" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[70] = v23;
    v22 = +[ML3DatabaseColumn columnWithName:@"cloud_author_handle" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[71] = v22;
    v21 = +[ML3DatabaseColumn columnWithName:@"cloud_universal_library_id" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[72] = v21;
    v20 = +[ML3DatabaseColumn columnWithName:@"should_display_index" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[73] = v20;
    v19 = +[ML3DatabaseColumn columnWithName:@"date_downloaded" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[74] = v19;
    v18 = +[ML3DatabaseColumn columnWithName:@"category_type_mask" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[75] = v18;
    v17 = +[ML3DatabaseColumn columnWithName:@"grouping_sort_key" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[76] = v17;
    v16 = +[ML3DatabaseColumn columnWithName:@"traits" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[77] = v16;
    v4 = +[ML3DatabaseColumn columnWithName:@"liked_state_changed_date" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[78] = v4;
    v5 = +[ML3DatabaseColumn columnWithName:@"is_collaborative" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[79] = v5;
    v6 = +[ML3DatabaseColumn columnWithName:@"collaborator_invite_options" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[80] = v6;
    v7 = +[ML3DatabaseColumn columnWithName:@"collaborator_permissions" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[81] = v7;
    v8 = +[ML3DatabaseColumn columnWithName:@"collaboration_invitation_link" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[82] = v8;
    v9 = +[ML3DatabaseColumn columnWithName:@"cover_artwork_recipe" datatype:4 constraints:16 defaultValue:&stru_1F08D4D70];
    v95[83] = v9;
    v10 = +[ML3DatabaseColumn columnWithName:@"collaboration_invitation_url_expiration_date" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[84] = v10;
    v11 = +[ML3DatabaseColumn columnWithName:@"collaboration_join_request_pending" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[85] = v11;
    v12 = +[ML3DatabaseColumn columnWithName:@"collaborator_status" datatype:2 constraints:16 defaultValue:&unk_1F0910F00];
    v95[86] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:87];
    v14 = v72->_columns;
    v72->_columns = (NSArray *)v13;

    columns = v72->_columns;
  }

  return columns;
}

- (id)name
{
  return @"container";
}

@end