@interface FCModifyUserInfoCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyUserInfoCommand)initWithUserInfoRecord:(id)a3;
@end

@implementation FCModifyUserInfoCommand

- (FCModifyUserInfoCommand)initWithUserInfoRecord:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v6, 1, v9, v10);
  return v7;
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"finishFirstLaunchVersion"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"finishFirstLaunchVersion"];
  v138 = (void *)v8;
  v139 = v7;
  if (v8 && [v7 compare:v8] != 1)
  {
    char v9 = 0;
  }
  else
  {
    [v6 setObject:v7 forKeyedSubscript:@"finishFirstLaunchVersion"];
    char v9 = 1;
  }
  v184 = [v5 objectForKeyedSubscript:@"sportsOnboardingState"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"sportsOnboardingState"];
  v191 = [v5 objectForKeyedSubscript:@"sportsOnboardingCompletedDate"];
  v190 = [v6 objectForKeyedSubscript:@"sportsOnboardingCompletedDate"];
  v11 = (id)FCUserInfoLog;
  v170 = (void *)v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v190 description];
    v13 = [v191 description];
    *(_DWORD *)buf = 138413058;
    uint64_t v193 = (uint64_t)v170;
    __int16 v194 = 2112;
    v195 = v184;
    __int16 v196 = 2112;
    uint64_t v197 = (uint64_t)v12;
    __int16 v198 = 2112;
    v199 = v13;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Will check to merge sports onboarding state local record to remote: remoteSportsState=%@, localSportsState=%@, remoteDate=%@, localDate=%@", buf, 0x2Au);

    uint64_t v10 = (uint64_t)v170;
  }

  if (!v10 || !v190 || objc_msgSend(v191, "fc_isLaterThan:withPrecision:", v190, 0))
  {
    v14 = (id)FCUserInfoLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "Merging sports onboarding local record to remote", buf, 2u);
    }

    [v6 setObject:v184 forKeyedSubscript:@"sportsOnboardingState"];
    [v6 setObject:v191 forKeyedSubscript:@"sportsOnboardingCompletedDate"];
    char v9 = 1;
  }
  v183 = [v5 objectForKeyedSubscript:@"shortcutsOnboardingState"];
  uint64_t v15 = [v6 objectForKeyedSubscript:@"shortcutsOnboardingState"];
  v182 = [v5 objectForKeyedSubscript:@"shortcutsOnboardingCompletedDate"];
  v189 = [v6 objectForKeyedSubscript:@"shortcutsOnboardingCompletedDate"];
  v16 = (id)FCUserInfoLog;
  v169 = (void *)v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v189 description];
    v18 = [v191 description];
    *(_DWORD *)buf = 138413058;
    uint64_t v193 = (uint64_t)v169;
    __int16 v194 = 2112;
    v195 = v183;
    __int16 v196 = 2112;
    uint64_t v197 = (uint64_t)v17;
    __int16 v198 = 2112;
    v199 = v18;
    _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "Will check to merge shortcuts onboarding state local record to remote: remoteShortcutsOnboardingState=%@, localShortcutsOnboardingState=%@, remoteDate=%@, localDate=%@", buf, 0x2Au);

    uint64_t v15 = (uint64_t)v169;
  }

  if (!v15 || !v189 || objc_msgSend(v182, "fc_isLaterThan:withPrecision:", v189, 0))
  {
    v19 = (id)FCUserInfoLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "Merging shortcuts onboarding state local record to remote", buf, 2u);
    }

    [v6 setObject:v183 forKeyedSubscript:@"shortcutsOnboardingState"];
    [v6 setObject:v182 forKeyedSubscript:@"shortcutsOnboardingCompletedDate"];
    char v9 = 1;
  }
  v181 = [v5 objectForKeyedSubscript:@"sportsSyncState"];
  uint64_t v20 = [v6 objectForKeyedSubscript:@"sportsSyncState"];
  v188 = [v5 objectForKeyedSubscript:@"sportsSyncStateLastSavedDate"];
  v187 = [v6 objectForKeyedSubscript:@"sportsSyncStateLastSavedDate"];
  v21 = (id)FCUserInfoLog;
  v168 = (void *)v20;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v187 description];
    v23 = [v188 description];
    *(_DWORD *)buf = 138413058;
    uint64_t v193 = (uint64_t)v168;
    __int16 v194 = 2112;
    v195 = v181;
    __int16 v196 = 2112;
    uint64_t v197 = (uint64_t)v22;
    __int16 v198 = 2112;
    v199 = v23;
    _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "Will check to merge sports sync state local record to remote: remoteSportsSyncState=%@, localSportsSyncState=%@, remoteDate=%@, localDate=%@", buf, 0x2Au);

    uint64_t v20 = (uint64_t)v168;
  }

  if (!v20 || !v187 || objc_msgSend(v188, "fc_isLaterThan:withPrecision:", v187, 0))
  {
    v24 = (id)FCUserInfoLog;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v24, OS_LOG_TYPE_DEFAULT, "Merging sports sync state local record to remote", buf, 2u);
    }

    [v6 setObject:v181 forKeyedSubscript:@"sportsSyncState"];
    [v6 setObject:v188 forKeyedSubscript:@"sportsSyncStateLastSavedDate"];
    char v9 = 1;
  }
  v25 = [v5 objectForKeyedSubscript:@"sportsFavoritesLastModifiedDate"];
  v26 = [v6 objectForKeyedSubscript:@"sportsFavoritesLastModifiedDate"];
  v27 = (id)FCUserInfoLog;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [v25 description];
    v29 = [v26 description];
    *(_DWORD *)buf = 138412546;
    uint64_t v193 = (uint64_t)v28;
    __int16 v194 = 2112;
    v195 = v29;
    _os_log_impl(&dword_1A460D000, v27, OS_LOG_TYPE_DEFAULT, "Will check to merge 'sports favorites last modified date' local record to remote: remoteSportsFavoritesLastModifiedDate=%@, localSportsFavoritesLastModifiedDate=%@", buf, 0x16u);
  }
  if (!v26 || objc_msgSend(v25, "fc_isLaterThan:withPrecision:", v26, 0))
  {
    v30 = (id)FCUserInfoLog;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEFAULT, "Merging 'sports favorites last modified date' local record to remote", buf, 2u);
    }

    [v6 setObject:v25 forKeyedSubscript:@"sportsFavoritesLastModifiedDate"];
    char v9 = 1;
  }
  v31 = v26;
  v137 = v25;
  v186 = [v5 objectForKeyedSubscript:@"feldsparID"];
  v167 = [v6 objectForKeyedSubscript:@"feldsparID"];
  v180 = [v5 objectForKeyedSubscript:@"notificationsUserID"];
  v166 = [v6 objectForKeyedSubscript:@"notificationsUserID"];
  v32 = [v5 objectForKeyedSubscript:@"lastOpenedDate"];
  uint64_t v33 = [v6 objectForKeyedSubscript:@"lastOpenedDate"];
  v34 = (id)FCUserInfoLog;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141559298;
    uint64_t v193 = 1752392040;
    __int16 v194 = 2112;
    v195 = v167;
    __int16 v196 = 2160;
    uint64_t v197 = 1752392040;
    __int16 v198 = 2112;
    v199 = v186;
    __int16 v200 = 2112;
    uint64_t v201 = v33;
    __int16 v202 = 2112;
    v203 = v32;
    _os_log_impl(&dword_1A460D000, v34, OS_LOG_TYPE_DEFAULT, "Will check to merge user id local record to remote: (masked) remoteID=%{mask.hash}@, localID=%{mask.hash}@, remoteDate=%@, localDate=%@", buf, 0x3Eu);
  }

  v165 = (void *)v33;
  v35 = v32;
  v140 = v32;
  if ([v32 compare:v33] || !v186)
  {
    uint64_t v36 = v33;
  }
  else
  {
    uint64_t v36 = v33;
    if (([v186 isEqualToString:v167] & 1) == 0)
    {
      v37 = (id)FCUserInfoLog;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v37, OS_LOG_TYPE_DEFAULT, "Merging user id local record to remote", buf, 2u);
      }

      [v6 setObject:v186 forKeyedSubscript:@"feldsparID"];
      char v9 = 1;
      v35 = v140;
    }
  }
  if (!v166 && v180)
  {
    [v6 setObject:v180 forKeyedSubscript:@"notificationsUserID"];
    char v9 = 1;
  }
  v156 = [v5 objectForKeyedSubscript:@"adsUserID"];
  uint64_t v38 = [v6 objectForKeyedSubscript:@"adsUserID"];
  v179 = [v5 objectForKeyedSubscript:@"adsUserIDCreatedDate"];
  v178 = [v6 objectForKeyedSubscript:@"adsUserIDCreatedDate"];
  v135 = (void *)v38;
  if (!v38 || !v178 || objc_msgSend(v179, "fc_isLaterThan:", v178))
  {
    [v6 setObject:v156 forKeyedSubscript:@"adsUserID"];
    [v6 setObject:v179 forKeyedSubscript:@"adsUserIDCreatedDate"];
    char v9 = 1;
  }
  v39 = [v5 objectForKeyedSubscript:@"sportsUserID"];
  uint64_t v40 = [v6 objectForKeyedSubscript:@"sportsUserID"];
  v136 = v31;
  v133 = (void *)v40;
  if (v39 && ([v39 isEqualToString:v40] & 1) == 0)
  {
    [v6 setObject:v39 forKeyedSubscript:@"sportsUserID"];
    char v9 = 1;
  }
  if (!v36 || [v35 compare:v36] == 1)
  {
    [v6 setObject:v35 forKeyedSubscript:@"lastOpenedDate"];
    char v9 = 1;
  }
  v41 = [v5 objectForKeyedSubscript:@"userStartDate"];
  uint64_t v42 = [v6 objectForKeyedSubscript:@"userStartDate"];
  if (v36)
  {
    id v43 = [v41 earlierDate:v42];

    if (!v42) {
      goto LABEL_63;
    }
LABEL_62:
    if (![v43 compare:v42]) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  id v43 = v41;
  if (v42) {
    goto LABEL_62;
  }
LABEL_63:
  [v6 setObject:v43 forKeyedSubscript:@"userStartDate"];
  char v9 = 1;
LABEL_64:
  v44 = [v5 objectForKeyedSubscript:@"lastViewedSavedDate"];
  uint64_t v45 = [v6 objectForKeyedSubscript:@"lastViewedSavedDate"];
  v128 = (void *)v45;
  v129 = v44;
  if (v45)
  {
    uint64_t v46 = v45;
    v47 = v44;
    uint64_t v48 = v46;
    id v49 = [v47 laterDate:v46];

    if (![v49 compare:v48]) {
      goto LABEL_69;
    }
  }
  else
  {
    id v49 = v44;
  }
  [v6 setObject:v49 forKeyedSubscript:@"lastViewedSavedDate"];
  char v9 = 1;
LABEL_69:
  v50 = [v5 objectForKeyedSubscript:@"lastViewedSharedWithYouDate"];
  uint64_t v51 = [v6 objectForKeyedSubscript:@"lastViewedSharedWithYouDate"];
  v127 = v49;
  v153 = (void *)v51;
  if (v50 && (!v51 || objc_msgSend(v50, "fc_isLaterThan:", v51)))
  {
    [v6 setObject:v50 forKeyedSubscript:@"lastViewedSharedWithYouDate"];
    char v9 = 1;
  }
  v52 = [v5 objectForKeyedSubscript:@"monthlyMeteredCount"];
  uint64_t v53 = [v6 objectForKeyedSubscript:@"monthlyMeteredCount"];
  v177 = v52;
  v125 = (void *)v53;
  v126 = v50;
  if (v52 && !v53 || [v52 compare:v53] == 1)
  {
    [v6 setObject:v52 forKeyedSubscript:@"monthlyMeteredCount"];
    char v9 = 1;
  }
  v54 = (void *)v42;
  v124 = [v6 objectForKeyedSubscript:@"totalMeteredCount"];
  if (!v124)
  {
    [v6 setObject:&unk_1EF8D7848 forKeyedSubscript:@"totalMeteredCount"];
    char v9 = 1;
  }
  id v55 = v43;
  v56 = [v5 objectForKeyedSubscript:@"meteredCountLastResetDate"];
  uint64_t v57 = [v6 objectForKeyedSubscript:@"meteredCountLastResetDate"];
  v152 = (void *)v57;
  v58 = v39;
  if (v56 && (!v57 || objc_msgSend(v56, "fc_isLaterThan:", v57)))
  {
    [v6 setObject:v56 forKeyedSubscript:@"meteredCountLastResetDate"];
    char v9 = 1;
  }
  v59 = [v5 objectForKeyedSubscript:@"monthlyPaidBundleMeteredCount"];
  uint64_t v60 = [v6 objectForKeyedSubscript:@"monthlyPaidBundleMeteredCount"];
  v176 = v59;
  v122 = (void *)v60;
  if (v59 && !v60 || [v59 compare:v60] == 1)
  {
    [v6 setObject:v59 forKeyedSubscript:@"monthlyPaidBundleMeteredCount"];
    char v9 = 1;
  }
  v61 = [v5 objectForKeyedSubscript:@"paidBundleMeteredCountLastResetDate"];
  uint64_t v62 = [v6 objectForKeyedSubscript:@"paidBundleMeteredCountLastResetDate"];
  v134 = v58;
  v164 = v61;
  v130 = v55;
  v151 = (void *)v62;
  if (v61 && (!v62 || objc_msgSend(v61, "fc_isLaterThan:", v62)))
  {
    [v6 setObject:v61 forKeyedSubscript:@"paidBundleMeteredCountLastResetDate"];
    char v9 = 1;
  }
  uint64_t v63 = [v5 objectForKeyedSubscript:@"upsellAppLaunchCount"];
  uint64_t v64 = [v6 objectForKeyedSubscript:@"upsellAppLaunchCount"];
  v131 = v54;
  v132 = v41;
  v120 = (void *)v64;
  if (v63 && !v64)
  {
    [v6 setObject:v63 forKeyedSubscript:@"upsellAppLaunchCount"];
    char v9 = 1;
  }
  v65 = [v5 objectForKeyedSubscript:@"lastAppLaunchUpsellInstanceID"];
  v66 = [v6 objectForKeyedSubscript:@"lastAppLaunchUpsellInstanceID"];
  v154 = v65;
  v67 = objc_msgSend(v65, "fc_numberFollowingString:", @"v");
  v119 = v66;
  uint64_t v68 = objc_msgSend(v66, "fc_numberFollowingString:", @"v");
  v69 = (void *)v68;
  if (v67 && (!v68 || [v67 compare:v68] == 1))
  {
    [v6 setObject:v154 forKeyedSubscript:@"lastAppLaunchUpsellInstanceID"];
    char v9 = 1;
  }
  v117 = v69;
  v70 = [v5 objectForKeyedSubscript:@"upsellAppLaunchLastSeenDate"];
  uint64_t v71 = [v6 objectForKeyedSubscript:@"upsellAppLaunchLastSeenDate"];
  v163 = v70;
  v150 = (void *)v71;
  if (v70 && (!v71 || [v70 compare:v71] == 1))
  {
    [v6 setObject:v70 forKeyedSubscript:@"upsellAppLaunchLastSeenDate"];
    char v9 = 1;
  }
  v72 = [v5 objectForKeyedSubscript:@"upsellAppLaunchLastShownCampaignID"];
  uint64_t v73 = [v6 objectForKeyedSubscript:@"upsellAppLaunchLastShownCampaignID"];
  v162 = v72;
  v149 = (void *)v73;
  if (v72 && (!v73 || [v72 compare:v73] == 1))
  {
    [v6 setObject:v72 forKeyedSubscript:@"upsellAppLaunchLastShownCampaignID"];
    char v9 = 1;
  }
  v74 = [v5 objectForKeyedSubscript:@"upsellAppLaunchLastPresenterBundleID"];
  uint64_t v75 = [v6 objectForKeyedSubscript:@"upsellAppLaunchLastPresenterBundleID"];
  v161 = v74;
  v148 = (void *)v75;
  if (v74 && (!v75 || [v74 compare:v75] == 1))
  {
    [v6 setObject:v74 forKeyedSubscript:@"upsellAppLaunchLastPresenterBundleID"];
    char v9 = 1;
  }
  v76 = [v5 objectForKeyedSubscript:@"newsletterSignupLastSeenDate"];
  uint64_t v77 = [v6 objectForKeyedSubscript:@"newsletterSignupLastSeenDate"];
  v160 = v76;
  v147 = (void *)v77;
  if (v76 && (!v77 || [v76 compare:v77] == 1))
  {
    [v6 setObject:v76 forKeyedSubscript:@"newsletterSignupLastSeenDate"];
    char v9 = 1;
  }
  v78 = [v5 objectForKeyedSubscript:@"personalizedNewsletterSignupLastSeenDate"];
  uint64_t v79 = [v6 objectForKeyedSubscript:@"personalizedNewsletterSignupLastSeenDate"];
  v159 = v78;
  v146 = (void *)v79;
  if (v78 && (!v79 || [v78 compare:v79] == 1))
  {
    [v6 setObject:v78 forKeyedSubscript:@"personalizedNewsletterSignupLastSeenDate"];
    char v9 = 1;
  }
  v80 = [v5 objectForKeyedSubscript:@"issuesNewsletterOptinLastSeenDate"];
  uint64_t v81 = [v6 objectForKeyedSubscript:@"issuesNewsletterOptinLastSeenDate"];
  v158 = v80;
  v145 = (void *)v81;
  if (v80 && (!v81 || [v80 compare:v81] == 1))
  {
    [v6 setObject:v80 forKeyedSubscript:@"issuesNewsletterOptinLastSeenDate"];
    char v9 = 1;
  }
  v82 = [v5 objectForKeyedSubscript:@"editorialArticleVersion"];
  v175 = [v6 objectForKeyedSubscript:@"editorialArticleVersion"];
  if (v82 && !v175 || v82 && ([v82 isEqualToString:v175] & 1) == 0)
  {
    [v6 setObject:v82 forKeyedSubscript:@"editorialArticleVersion"];
    char v9 = 1;
  }
  uint64_t v83 = [v5 objectForKeyedSubscript:@"marketingNotificationsEnabled"];
  uint64_t v84 = [v6 objectForKeyedSubscript:@"marketingNotificationsEnabled"];
  v85 = (void *)v83;
  v86 = (void *)v84;
  v116 = v82;
  v155 = v85;
  if (v85 && !v84 || v85 && (int v87 = [v85 BOOLValue], v87 != objc_msgSend(v86, "BOOLValue")))
  {
    [v6 setObject:v155 forKeyedSubscript:@"marketingNotificationsEnabled"];
    char v9 = 1;
  }
  v88 = [v5 objectForKeyedSubscript:@"newIssueNotificationsEnabled"];
  v174 = [v6 objectForKeyedSubscript:@"newIssueNotificationsEnabled"];
  v143 = v88;
  if (v88 && !v174
    || v88
    && (int v89 = [v88 BOOLValue],
        BOOL v90 = v89 == [v174 BOOLValue],
        v88 = v143,
        !v90))
  {
    [v6 setObject:v88 forKeyedSubscript:@"newIssueNotificationsEnabled"];
    char v9 = 1;
  }
  v91 = [v5 objectForKeyedSubscript:@"endOfAudioNotificationsEnabled"];
  v173 = [v6 objectForKeyedSubscript:@"endOfAudioNotificationsEnabled"];
  v142 = v91;
  if (v91 && !v173
    || v91
    && (int v92 = [v91 BOOLValue],
        BOOL v90 = v92 == [v173 BOOLValue],
        v91 = v142,
        !v90))
  {
    [v6 setObject:v91 forKeyedSubscript:@"endOfAudioNotificationsEnabled"];
    char v9 = 1;
  }
  v93 = [v5 objectForKeyedSubscript:@"sportsTopicNotificationsEnabledState2"];
  v172 = [v6 objectForKeyedSubscript:@"sportsTopicNotificationsEnabledState2"];
  v141 = v93;
  if (v93 && !v172
    || v93
    && (v94 = [v93 integerValue], BOOL v90 = v94 == objc_msgSend(v172, "integerValue"), v93 = v141, !v90))
  {
    [v6 setObject:v93 forKeyedSubscript:@"sportsTopicNotificationsEnabledState2"];
    char v9 = 1;
  }
  v95 = [v5 objectForKeyedSubscript:@"canonicalLanguage"];
  v171 = [v6 objectForKeyedSubscript:@"canonicalLanguage"];
  if (v95 && !v171 || v95 && ([v95 isEqualToString:v171] & 1) == 0)
  {
    [v6 setObject:v95 forKeyedSubscript:@"canonicalLanguage"];
    char v9 = 1;
  }
  v96 = [v5 objectForKeyedSubscript:@"postPurchaseOnboardingLastSeenDate"];
  uint64_t v97 = [v6 objectForKeyedSubscript:@"postPurchaseOnboardingLastSeenDate"];
  v157 = v96;
  v114 = v95;
  v144 = (void *)v97;
  if (v96 && (!v97 || [v96 compare:v97] == 1))
  {
    [v6 setObject:v96 forKeyedSubscript:@"postPurchaseOnboardingLastSeenDate"];
    char v9 = 1;
  }
  v98 = [v5 objectForKeyedSubscript:@"appReviewRequestLastSeenDate"];
  uint64_t v99 = [v6 objectForKeyedSubscript:@"appReviewRequestLastSeenDate"];
  v100 = (void *)v99;
  v123 = v56;
  v121 = (void *)v63;
  if (v98 && (!v99 || [v98 compare:v99] == 1))
  {
    [v6 setObject:v98 forKeyedSubscript:@"appReviewRequestLastSeenDate"];
    char v9 = 1;
  }
  BOOL v185 = v9;
  v101 = [v5 objectForKeyedSubscript:@"puzzleNotificationsLastChangedDate"];
  uint64_t v102 = [v6 objectForKeyedSubscript:@"puzzleNotificationsLastChangedDate"];
  v103 = (void *)v102;
  BOOL v104 = v102 == 0;
  v118 = v67;
  v115 = v86;
  v113 = v100;
  if (v101)
  {
    if (v102 && !objc_msgSend(v101, "fc_isLaterThan:", v102))
    {
      BOOL v104 = 0;
    }
    else
    {
      [v6 setObject:v101 forKeyedSubscript:@"puzzleNotificationsLastChangedDate"];
      BOOL v104 = 1;
      BOOL v185 = 1;
    }
  }
  v105 = [v5 objectForKeyedSubscript:@"puzzleNotificationsEnabled2"];
  uint64_t v106 = [v6 objectForKeyedSubscript:@"puzzleNotificationsEnabled2"];
  v107 = (void *)v106;
  if (v105 && !v106
    || v105
    && (int v108 = [v105 BOOLValue], ((v108 ^ objc_msgSend(v107, "BOOLValue")) & v104) == 1))
  {
    [v6 setObject:v105 forKeyedSubscript:@"puzzleNotificationsEnabled2"];
    BOOL v185 = 1;
  }
  v109 = [v5 objectForKeyedSubscript:@"puzzleStatsStartDate"];
  uint64_t v110 = [v6 objectForKeyedSubscript:@"puzzleStatsStartDate"];
  v111 = (void *)v110;
  if (v109 && (!v110 || [v109 compare:v110] == -1))
  {
    [v6 setObject:v109 forKeyedSubscript:@"puzzleStatsStartDate"];
    BOOL v185 = 1;
  }

  return v185;
}

@end