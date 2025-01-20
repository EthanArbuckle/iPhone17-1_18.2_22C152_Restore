@interface ICPAPlayActivityEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addBuildFeatures:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICPAPlayActivityEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_timedMetadata, 0);
  objc_storeStrong((id *)&self->_targetedAudioQuality, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_providedAudioQuality, 0);
  objc_storeStrong((id *)&self->_playlistVersionHash, 0);
  objc_storeStrong((id *)&self->_playMode, 0);
  objc_storeStrong((id *)&self->_personalizedContainerID, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_lyricLanguage, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_eventTimeZoneName, 0);
  objc_storeStrong((id *)&self->_enqueuerProperties, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);

  objc_storeStrong((id *)&self->_buildFeatures, 0);
}

- (unint64_t)hash
{
  NSUInteger v110 = [(NSString *)self->_containerID hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    uint64_t v109 = 2654435761 * self->_containerType;
  }
  else {
    uint64_t v109 = 0;
  }
  NSUInteger v108 = [(NSString *)self->_deviceName hash];
  $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    uint64_t v107 = 2654435761 * self->_endReasonType;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v8 = 0;
    goto LABEL_14;
  }
  uint64_t v107 = 0;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double eventDateTimestamp = self->_eventDateTimestamp;
  double v5 = -eventDateTimestamp;
  if (eventDateTimestamp >= 0.0) {
    double v5 = self->_eventDateTimestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  unint64_t v106 = v8;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    double eventSecondsFromGMT = self->_eventSecondsFromGMT;
    double v11 = -eventSecondsFromGMT;
    if (eventSecondsFromGMT >= 0.0) {
      double v11 = self->_eventSecondsFromGMT;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v105 = v9;
  NSUInteger v104 = [(NSString *)self->_externalID hash];
  NSUInteger v103 = [(NSString *)self->_featureName hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
    double itemDuration = self->_itemDuration;
    double v17 = -itemDuration;
    if (itemDuration >= 0.0) {
      double v17 = self->_itemDuration;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    double itemEndTime = self->_itemEndTime;
    double v22 = -itemEndTime;
    if (itemEndTime >= 0.0) {
      double v22 = self->_itemEndTime;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    double itemStartTime = self->_itemStartTime;
    double v27 = -itemStartTime;
    if (itemStartTime >= 0.0) {
      double v27 = self->_itemStartTime;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((*(_DWORD *)&v14 & 0x8000000) == 0)
  {
    uint64_t v101 = 0;
    if ((*(_DWORD *)&v14 & 0x10000000) != 0) {
      goto LABEL_48;
    }
LABEL_51:
    uint64_t v100 = 0;
    if ((*(void *)&v14 & 0x4000000000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_52;
  }
  uint64_t v101 = 2654435761 * self->_itemType;
  if ((*(_DWORD *)&v14 & 0x10000000) == 0) {
    goto LABEL_51;
  }
LABEL_48:
  uint64_t v100 = 2654435761 * self->_mediaType;
  if ((*(void *)&v14 & 0x4000000000) != 0)
  {
LABEL_49:
    uint64_t v99 = 2654435761 * self->_offline;
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v99 = 0;
LABEL_53:
  unint64_t v102 = v25;
  if ((*(_WORD *)&v14 & 0x400) != 0) {
    uint64_t v98 = 2654435761 * self->_persistentID;
  }
  else {
    uint64_t v98 = 0;
  }
  NSUInteger v97 = [(NSString *)self->_personalizedContainerID hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v30 = self->_has;
  if ((*(void *)&v30 & 0x10000000000) == 0)
  {
    uint64_t v96 = 0;
    if ((*(void *)&v30 & 0x100000000) != 0) {
      goto LABEL_58;
    }
LABEL_61:
    uint64_t v95 = 0;
    if ((*(_DWORD *)&v30 & 0x20000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_62;
  }
  uint64_t v96 = 2654435761 * self->_sBEnabled;
  if ((*(void *)&v30 & 0x100000000) == 0) {
    goto LABEL_61;
  }
LABEL_58:
  uint64_t v95 = 2654435761 * self->_sourceType;
  if ((*(_DWORD *)&v30 & 0x20000) != 0)
  {
LABEL_59:
    unint64_t v94 = 2654435761u * self->_storeAccountID;
    goto LABEL_63;
  }
LABEL_62:
  unint64_t v94 = 0;
LABEL_63:
  NSUInteger v93 = [(NSString *)self->_storeID hash];
  uint64_t v92 = [(NSData *)self->_timedMetadata hash];
  uint64_t v91 = [(NSData *)self->_trackInfo hash];
  uint64_t v90 = [(NSData *)self->_recommendationData hash];
  NSUInteger v89 = [(NSString *)self->_storeFrontID hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x4000000) != 0)
  {
    uint64_t v88 = 2654435761 * self->_eventType;
    if ((*(_DWORD *)&v31 & 0x40000) != 0)
    {
LABEL_65:
      uint64_t v87 = 2654435761 * self->_subscriptionAdamID;
      if ((*(_WORD *)&v31 & 0x800) != 0) {
        goto LABEL_66;
      }
      goto LABEL_71;
    }
  }
  else
  {
    uint64_t v88 = 0;
    if ((*(_DWORD *)&v31 & 0x40000) != 0) {
      goto LABEL_65;
    }
  }
  uint64_t v87 = 0;
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
LABEL_66:
    uint64_t v86 = 2654435761 * self->_purchasedAdamID;
    if ((*(_WORD *)&v31 & 0x1000) != 0) {
      goto LABEL_67;
    }
LABEL_72:
    uint64_t v85 = 0;
    if ((*(unsigned char *)&v31 & 0x40) != 0) {
      goto LABEL_68;
    }
    goto LABEL_73;
  }
LABEL_71:
  uint64_t v86 = 0;
  if ((*(_WORD *)&v31 & 0x1000) == 0) {
    goto LABEL_72;
  }
LABEL_67:
  uint64_t v85 = 2654435761 * self->_radioAdamID;
  if ((*(unsigned char *)&v31 & 0x40) != 0)
  {
LABEL_68:
    unint64_t v84 = 2654435761u * self->_itemCloudID;
    goto LABEL_74;
  }
LABEL_73:
  unint64_t v84 = 0;
LABEL_74:
  NSUInteger v83 = [(NSString *)self->_lyricsID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v82 = 2654435761 * self->_containerAdamID;
  }
  else {
    uint64_t v82 = 0;
  }
  NSUInteger v81 = [(NSString *)self->_globalPlaylistID hash];
  NSUInteger v80 = [(NSString *)self->_stationHash hash];
  NSUInteger v79 = [(NSString *)self->_stationStringID hash];
  if (*((unsigned char *)&self->_has + 2)) {
    uint64_t v78 = 2654435761 * self->_stationID;
  }
  else {
    uint64_t v78 = 0;
  }
  NSUInteger v77 = [(NSString *)self->_cloudAlbumID hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v32 = self->_has;
  if ((*(unsigned char *)&v32 & 2) != 0)
  {
    unint64_t v76 = 2654435761u * self->_cloudPlaylistID;
    if ((*(_DWORD *)&v32 & 0x40000000) != 0) {
      goto LABEL_82;
    }
  }
  else
  {
    unint64_t v76 = 0;
    if ((*(_DWORD *)&v32 & 0x40000000) != 0)
    {
LABEL_82:
      uint64_t v75 = 2654435761 * self->_reasonHintType;
      goto LABEL_85;
    }
  }
  uint64_t v75 = 0;
LABEL_85:
  NSUInteger v74 = [(NSString *)self->_buildVersion hash];
  NSUInteger v73 = [(NSString *)self->_playlistVersionHash hash];
  NSUInteger v72 = [(NSString *)self->_requestingBundleIdentifier hash];
  NSUInteger v71 = [(NSString *)self->_requestingBundleVersion hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v33 = self->_has;
  if ((*(unsigned char *)&v33 & 8) != 0)
  {
    uint64_t v70 = 2654435761 * self->_equivalencySourceAdamID;
    if ((*(void *)&v33 & 0x1000000000) != 0)
    {
LABEL_87:
      uint64_t v69 = 2654435761 * self->_internalBuild;
      if ((*(_DWORD *)&v33 & 0x80000) != 0) {
        goto LABEL_88;
      }
LABEL_92:
      uint64_t v68 = 0;
      if ((*(_DWORD *)&v33 & 0x100000) != 0) {
        goto LABEL_89;
      }
      goto LABEL_93;
    }
  }
  else
  {
    uint64_t v70 = 0;
    if ((*(void *)&v33 & 0x1000000000) != 0) {
      goto LABEL_87;
    }
  }
  uint64_t v69 = 0;
  if ((*(_DWORD *)&v33 & 0x80000) == 0) {
    goto LABEL_92;
  }
LABEL_88:
  uint64_t v68 = 2654435761 * self->_tvShowPurchasedAdamID;
  if ((*(_DWORD *)&v33 & 0x100000) != 0)
  {
LABEL_89:
    uint64_t v67 = 2654435761 * self->_tvShowSubscriptionAdamID;
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v67 = 0;
LABEL_94:
  unint64_t v66 = [(ICPAPlayActivityEnqueuerProperties *)self->_enqueuerProperties hash];
  NSUInteger v65 = [(NSString *)self->_householdID hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v34 = self->_has;
  if ((*(void *)&v34 & 0x8000000000) == 0)
  {
    uint64_t v64 = 0;
    if ((*(void *)&v34 & 0x20000000000) != 0) {
      goto LABEL_96;
    }
LABEL_99:
    uint64_t v63 = 0;
    if ((*(void *)&v34 & 0x200000000) != 0) {
      goto LABEL_97;
    }
    goto LABEL_100;
  }
  uint64_t v64 = 2654435761 * self->_privateListeningEnabled;
  if ((*(void *)&v34 & 0x20000000000) == 0) {
    goto LABEL_99;
  }
LABEL_96:
  uint64_t v63 = 2654435761 * self->_siriInitiated;
  if ((*(void *)&v34 & 0x200000000) != 0)
  {
LABEL_97:
    uint64_t v62 = 2654435761 * self->_systemReleaseType;
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v62 = 0;
LABEL_101:
  NSUInteger v61 = [(NSString *)self->_eventTimeZoneName hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x1000000) != 0)
  {
    uint64_t v60 = 2654435761 * self->_displayType;
    if (*(unsigned char *)&v35) {
      goto LABEL_103;
    }
  }
  else
  {
    uint64_t v60 = 0;
    if (*(unsigned char *)&v35)
    {
LABEL_103:
      uint64_t v59 = 2654435761 * self->_characterDisplayedCount;
      goto LABEL_106;
    }
  }
  uint64_t v59 = 0;
LABEL_106:
  NSUInteger v58 = [(NSString *)self->_lyricLanguage hash];
  uint64_t v57 = [(NSMutableArray *)self->_buildFeatures hash];
  unint64_t v56 = [(ICPAPlayModeDictionary *)self->_playMode hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x400000) != 0)
  {
    uint64_t v55 = 2654435761 * self->_audioQualityPreference;
    if ((*(_DWORD *)&v36 & 0x20000000) != 0) {
      goto LABEL_108;
    }
  }
  else
  {
    uint64_t v55 = 0;
    if ((*(_DWORD *)&v36 & 0x20000000) != 0)
    {
LABEL_108:
      uint64_t v54 = 2654435761 * self->_playbackFormatPreference;
      goto LABEL_111;
    }
  }
  uint64_t v54 = 0;
LABEL_111:
  unint64_t v53 = [(ICPAAudioQualityDictionary *)self->_targetedAudioQuality hash];
  unint64_t v52 = [(ICPAAudioQualityDictionary *)self->_providedAudioQuality hash];
  NSUInteger v37 = [(NSString *)self->_queueGroupingID hash];
  $1C24819EE6FCB6BF7661081CD3A68180 v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x2000) != 0)
  {
    uint64_t v39 = 2654435761 * self->_reportingAdamID;
    if ((*(_WORD *)&v38 & 0x4000) != 0)
    {
LABEL_113:
      uint64_t v40 = 2654435761 * self->_sharedActivityGroupSizeCurrent;
      if ((*(_WORD *)&v38 & 0x8000) != 0) {
        goto LABEL_114;
      }
      goto LABEL_122;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((*(_WORD *)&v38 & 0x4000) != 0) {
      goto LABEL_113;
    }
  }
  uint64_t v40 = 0;
  if ((*(_WORD *)&v38 & 0x8000) != 0)
  {
LABEL_114:
    uint64_t v41 = 2654435761 * self->_sharedActivityGroupSizeMax;
    if ((*(void *)&v38 & 0x400000000) != 0) {
      goto LABEL_115;
    }
LABEL_123:
    uint64_t v42 = 0;
    if ((*(_DWORD *)&v38 & 0x200000) != 0) {
      goto LABEL_116;
    }
LABEL_124:
    unint64_t v47 = 0;
    goto LABEL_127;
  }
LABEL_122:
  uint64_t v41 = 0;
  if ((*(void *)&v38 & 0x400000000) == 0) {
    goto LABEL_123;
  }
LABEL_115:
  uint64_t v42 = 2654435761 * self->_vocalAttenuationAvailibility;
  if ((*(_DWORD *)&v38 & 0x200000) == 0) {
    goto LABEL_124;
  }
LABEL_116:
  double vocalAttenuationDuration = self->_vocalAttenuationDuration;
  double v44 = -vocalAttenuationDuration;
  if (vocalAttenuationDuration >= 0.0) {
    double v44 = self->_vocalAttenuationDuration;
  }
  long double v45 = floor(v44 + 0.5);
  double v46 = (v44 - v45) * 1.84467441e19;
  unint64_t v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0) {
      v47 += (unint64_t)v46;
    }
  }
  else
  {
    v47 -= (unint64_t)fabs(v46);
  }
LABEL_127:
  if ((*(void *)&v38 & 0x800000000) == 0)
  {
    uint64_t v48 = 0;
    if ((*(void *)&v38 & 0x2000000000) != 0) {
      goto LABEL_129;
    }
LABEL_132:
    uint64_t v49 = 0;
    if ((*(_DWORD *)&v38 & 0x80000000) != 0) {
      goto LABEL_130;
    }
LABEL_133:
    uint64_t v50 = 0;
    return v109 ^ v110 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v15 ^ v20 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v37 ^ v39 ^ v40 ^ v41 ^ v42 ^ v47 ^ v48 ^ v49 ^ v50;
  }
  uint64_t v48 = 2654435761 * self->_continuityCameraUsed;
  if ((*(void *)&v38 & 0x2000000000) == 0) {
    goto LABEL_132;
  }
LABEL_129:
  uint64_t v49 = 2654435761 * self->_isCollaborativePlaylist;
  if ((*(_DWORD *)&v38 & 0x80000000) == 0) {
    goto LABEL_133;
  }
LABEL_130:
  uint64_t v50 = 2654435761 * self->_sharedActivityType;
  return v109 ^ v110 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v15 ^ v20 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v37 ^ v39 ^ v40 ^ v41 ^ v42 ^ v47 ^ v48 ^ v49 ^ v50;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_294;
  }
  containerID = self->_containerID;
  if ((unint64_t)containerID | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](containerID, "isEqual:")) {
      goto LABEL_294;
    }
  }
  $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
  uint64_t v7 = *(void *)(v4 + 500);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_containerType != *((_DWORD *)v4 + 56)) {
      goto LABEL_294;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_294;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_294;
    }
    $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
    uint64_t v7 = *(void *)(v4 + 500);
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_endReasonType != *((_DWORD *)v4 + 61)) {
      goto LABEL_294;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_eventDateTimestamp != *((double *)v4 + 5)) {
      goto LABEL_294;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_294;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_eventSecondsFromGMT != *((double *)v4 + 6)) {
      goto LABEL_294;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_294;
  }
  externalID = self->_externalID;
  if ((unint64_t)externalID | *((void *)v4 + 34)
    && !-[NSString isEqual:](externalID, "isEqual:"))
  {
    goto LABEL_294;
  }
  featureName = self->_featureName;
  if ((unint64_t)featureName | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](featureName, "isEqual:")) {
      goto LABEL_294;
    }
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v11 = self->_has;
  uint64_t v12 = *(void *)(v4 + 500);
  if ((*(unsigned char *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_itemDuration != *((double *)v4 + 8)) {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_itemEndTime != *((double *)v4 + 9)) {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0 || self->_itemStartTime != *((double *)v4 + 10)) {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v11 & 0x8000000) != 0)
  {
    if ((v12 & 0x8000000) == 0 || self->_itemType != *((_DWORD *)v4 + 76)) {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x8000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v11 & 0x10000000) != 0)
  {
    if ((v12 & 0x10000000) == 0 || self->_mediaType != *((_DWORD *)v4 + 82)) {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x10000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(void *)&v11 & 0x4000000000) != 0)
  {
    if ((v12 & 0x4000000000) == 0) {
      goto LABEL_294;
    }
    if (self->_offline)
    {
      if (!v4[495]) {
        goto LABEL_294;
      }
    }
    else if (v4[495])
    {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x4000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_persistentID != *((void *)v4 + 11)) {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_294;
  }
  personalizedContainerID = self->_personalizedContainerID;
  if ((unint64_t)personalizedContainerID | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](personalizedContainerID, "isEqual:")) {
      goto LABEL_294;
    }
    $1C24819EE6FCB6BF7661081CD3A68180 v11 = self->_has;
    uint64_t v12 = *(void *)(v4 + 500);
  }
  if ((*(void *)&v11 & 0x10000000000) != 0)
  {
    if ((v12 & 0x10000000000) == 0) {
      goto LABEL_294;
    }
    if (self->_sBEnabled)
    {
      if (!v4[497]) {
        goto LABEL_294;
      }
    }
    else if (v4[497])
    {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x10000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(void *)&v11 & 0x100000000) != 0)
  {
    if ((v12 & 0x100000000) == 0 || self->_sourceType != *((_DWORD *)v4 + 105)) {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x100000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    if ((v12 & 0x20000) == 0 || self->_storeAccountID != *((void *)v4 + 18)) {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x20000) != 0)
  {
    goto LABEL_294;
  }
  storeID = self->_storeID;
  if ((unint64_t)storeID | *((void *)v4 + 56) && !-[NSString isEqual:](storeID, "isEqual:")) {
    goto LABEL_294;
  }
  timedMetadata = self->_timedMetadata;
  if ((unint64_t)timedMetadata | *((void *)v4 + 59))
  {
    if (!-[NSData isEqual:](timedMetadata, "isEqual:")) {
      goto LABEL_294;
    }
  }
  trackInfo = self->_trackInfo;
  if ((unint64_t)trackInfo | *((void *)v4 + 60))
  {
    if (!-[NSData isEqual:](trackInfo, "isEqual:")) {
      goto LABEL_294;
    }
  }
  recommendationData = self->_recommendationData;
  if ((unint64_t)recommendationData | *((void *)v4 + 49))
  {
    if (!-[NSData isEqual:](recommendationData, "isEqual:")) {
      goto LABEL_294;
    }
  }
  storeFrontID = self->_storeFrontID;
  if ((unint64_t)storeFrontID | *((void *)v4 + 55))
  {
    if (!-[NSString isEqual:](storeFrontID, "isEqual:")) {
      goto LABEL_294;
    }
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  uint64_t v20 = *(void *)(v4 + 500);
  if ((*(_DWORD *)&v19 & 0x4000000) != 0)
  {
    if ((v20 & 0x4000000) == 0 || self->_eventType != *((_DWORD *)v4 + 66)) {
      goto LABEL_294;
    }
  }
  else if ((v20 & 0x4000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v19 & 0x40000) != 0)
  {
    if ((v20 & 0x40000) == 0 || self->_subscriptionAdamID != *((void *)v4 + 19)) {
      goto LABEL_294;
    }
  }
  else if ((v20 & 0x40000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v19 & 0x800) != 0)
  {
    if ((v20 & 0x800) == 0 || self->_purchasedAdamID != *((void *)v4 + 12)) {
      goto LABEL_294;
    }
  }
  else if ((v20 & 0x800) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v19 & 0x1000) != 0)
  {
    if ((v20 & 0x1000) == 0 || self->_radioAdamID != *((void *)v4 + 13)) {
      goto LABEL_294;
    }
  }
  else if ((v20 & 0x1000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_itemCloudID != *((void *)v4 + 7)) {
      goto LABEL_294;
    }
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_294;
  }
  lyricsID = self->_lyricsID;
  if ((unint64_t)lyricsID | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](lyricsID, "isEqual:")) {
      goto LABEL_294;
    }
    $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
    uint64_t v20 = *(void *)(v4 + 500);
  }
  if ((*(unsigned char *)&v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_containerAdamID != *((void *)v4 + 3)) {
      goto LABEL_294;
    }
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_294;
  }
  globalPlaylistID = self->_globalPlaylistID;
  if ((unint64_t)globalPlaylistID | *((void *)v4 + 36)
    && !-[NSString isEqual:](globalPlaylistID, "isEqual:"))
  {
    goto LABEL_294;
  }
  stationHash = self->_stationHash;
  if ((unint64_t)stationHash | *((void *)v4 + 53))
  {
    if (!-[NSString isEqual:](stationHash, "isEqual:")) {
      goto LABEL_294;
    }
  }
  stationStringID = self->_stationStringID;
  if ((unint64_t)stationStringID | *((void *)v4 + 54))
  {
    if (!-[NSString isEqual:](stationStringID, "isEqual:")) {
      goto LABEL_294;
    }
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v25 = self->_has;
  uint64_t v26 = *(void *)(v4 + 500);
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    if ((v26 & 0x10000) == 0 || self->_stationID != *((void *)v4 + 17)) {
      goto LABEL_294;
    }
  }
  else if ((v26 & 0x10000) != 0)
  {
    goto LABEL_294;
  }
  cloudAlbumID = self->_cloudAlbumID;
  if ((unint64_t)cloudAlbumID | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](cloudAlbumID, "isEqual:")) {
      goto LABEL_294;
    }
    $1C24819EE6FCB6BF7661081CD3A68180 v25 = self->_has;
    uint64_t v26 = *(void *)(v4 + 500);
  }
  if ((*(unsigned char *)&v25 & 2) != 0)
  {
    if ((v26 & 2) == 0 || self->_cloudPlaylistID != *((void *)v4 + 2)) {
      goto LABEL_294;
    }
  }
  else if ((v26 & 2) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v25 & 0x40000000) != 0)
  {
    if ((v26 & 0x40000000) == 0 || self->_reasonHintType != *((_DWORD *)v4 + 96)) {
      goto LABEL_294;
    }
  }
  else if ((v26 & 0x40000000) != 0)
  {
    goto LABEL_294;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 25)
    && !-[NSString isEqual:](buildVersion, "isEqual:"))
  {
    goto LABEL_294;
  }
  playlistVersionHash = self->_playlistVersionHash;
  if ((unint64_t)playlistVersionHash | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](playlistVersionHash, "isEqual:")) {
      goto LABEL_294;
    }
  }
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if ((unint64_t)requestingBundleIdentifier | *((void *)v4 + 50))
  {
    if (!-[NSString isEqual:](requestingBundleIdentifier, "isEqual:")) {
      goto LABEL_294;
    }
  }
  requestingBundleVersion = self->_requestingBundleVersion;
  if ((unint64_t)requestingBundleVersion | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](requestingBundleVersion, "isEqual:")) {
      goto LABEL_294;
    }
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v32 = self->_has;
  uint64_t v33 = *(void *)(v4 + 500);
  if ((*(unsigned char *)&v32 & 8) != 0)
  {
    if ((v33 & 8) == 0 || self->_equivalencySourceAdamID != *((void *)v4 + 4)) {
      goto LABEL_294;
    }
  }
  else if ((v33 & 8) != 0)
  {
    goto LABEL_294;
  }
  if ((*(void *)&v32 & 0x1000000000) != 0)
  {
    if ((v33 & 0x1000000000) == 0) {
      goto LABEL_294;
    }
    if (self->_internalBuild)
    {
      if (!v4[493]) {
        goto LABEL_294;
      }
    }
    else if (v4[493])
    {
      goto LABEL_294;
    }
  }
  else if ((v33 & 0x1000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v32 & 0x80000) != 0)
  {
    if ((v33 & 0x80000) == 0 || self->_tvShowPurchasedAdamID != *((void *)v4 + 20)) {
      goto LABEL_294;
    }
  }
  else if ((v33 & 0x80000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v32 & 0x100000) != 0)
  {
    if ((v33 & 0x100000) == 0 || self->_tvShowSubscriptionAdamID != *((void *)v4 + 21)) {
      goto LABEL_294;
    }
  }
  else if ((v33 & 0x100000) != 0)
  {
    goto LABEL_294;
  }
  enqueuerProperties = self->_enqueuerProperties;
  if ((unint64_t)enqueuerProperties | *((void *)v4 + 31)
    && !-[ICPAPlayActivityEnqueuerProperties isEqual:](enqueuerProperties, "isEqual:"))
  {
    goto LABEL_294;
  }
  householdID = self->_householdID;
  if ((unint64_t)householdID | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](householdID, "isEqual:")) {
      goto LABEL_294;
    }
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v36 = self->_has;
  uint64_t v37 = *(void *)(v4 + 500);
  if ((*(void *)&v36 & 0x8000000000) != 0)
  {
    if ((v37 & 0x8000000000) == 0) {
      goto LABEL_294;
    }
    if (self->_privateListeningEnabled)
    {
      if (!v4[496]) {
        goto LABEL_294;
      }
    }
    else if (v4[496])
    {
      goto LABEL_294;
    }
  }
  else if ((v37 & 0x8000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(void *)&v36 & 0x20000000000) != 0)
  {
    if ((v37 & 0x20000000000) == 0) {
      goto LABEL_294;
    }
    if (self->_siriInitiated)
    {
      if (!v4[498]) {
        goto LABEL_294;
      }
    }
    else if (v4[498])
    {
      goto LABEL_294;
    }
  }
  else if ((v37 & 0x20000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(void *)&v36 & 0x200000000) != 0)
  {
    if ((v37 & 0x200000000) == 0 || self->_systemReleaseType != *((_DWORD *)v4 + 114)) {
      goto LABEL_294;
    }
  }
  else if ((v37 & 0x200000000) != 0)
  {
    goto LABEL_294;
  }
  eventTimeZoneName = self->_eventTimeZoneName;
  if ((unint64_t)eventTimeZoneName | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](eventTimeZoneName, "isEqual:")) {
      goto LABEL_294;
    }
    $1C24819EE6FCB6BF7661081CD3A68180 v36 = self->_has;
    uint64_t v37 = *(void *)(v4 + 500);
  }
  if ((*(_DWORD *)&v36 & 0x1000000) != 0)
  {
    if ((v37 & 0x1000000) == 0 || self->_displayType != *((_DWORD *)v4 + 60)) {
      goto LABEL_294;
    }
  }
  else if ((v37 & 0x1000000) != 0)
  {
    goto LABEL_294;
  }
  if (*(unsigned char *)&v36)
  {
    if ((v37 & 1) == 0 || self->_characterDisplayedCount != *((void *)v4 + 1)) {
      goto LABEL_294;
    }
  }
  else if (v37)
  {
    goto LABEL_294;
  }
  lyricLanguage = self->_lyricLanguage;
  if ((unint64_t)lyricLanguage | *((void *)v4 + 39)
    && !-[NSString isEqual:](lyricLanguage, "isEqual:"))
  {
    goto LABEL_294;
  }
  buildFeatures = self->_buildFeatures;
  if ((unint64_t)buildFeatures | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](buildFeatures, "isEqual:")) {
      goto LABEL_294;
    }
  }
  playMode = self->_playMode;
  if ((unint64_t)playMode | *((void *)v4 + 43))
  {
    if (!-[ICPAPlayModeDictionary isEqual:](playMode, "isEqual:")) {
      goto LABEL_294;
    }
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v42 = self->_has;
  uint64_t v43 = *(void *)(v4 + 500);
  if ((*(_DWORD *)&v42 & 0x400000) != 0)
  {
    if ((v43 & 0x400000) == 0 || self->_audioQualityPreference != *((_DWORD *)v4 + 46)) {
      goto LABEL_294;
    }
  }
  else if ((v43 & 0x400000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v42 & 0x20000000) != 0)
  {
    if ((v43 & 0x20000000) == 0 || self->_playbackFormatPreference != *((_DWORD *)v4 + 88)) {
      goto LABEL_294;
    }
  }
  else if ((v43 & 0x20000000) != 0)
  {
    goto LABEL_294;
  }
  targetedAudioQuality = self->_targetedAudioQuality;
  if ((unint64_t)targetedAudioQuality | *((void *)v4 + 58)
    && !-[ICPAAudioQualityDictionary isEqual:](targetedAudioQuality, "isEqual:"))
  {
    goto LABEL_294;
  }
  providedAudioQuality = self->_providedAudioQuality;
  if ((unint64_t)providedAudioQuality | *((void *)v4 + 46))
  {
    if (!-[ICPAAudioQualityDictionary isEqual:](providedAudioQuality, "isEqual:")) {
      goto LABEL_294;
    }
  }
  queueGroupingID = self->_queueGroupingID;
  if ((unint64_t)queueGroupingID | *((void *)v4 + 47))
  {
    if (!-[NSString isEqual:](queueGroupingID, "isEqual:")) {
      goto LABEL_294;
    }
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v47 = self->_has;
  uint64_t v48 = *(void *)(v4 + 500);
  if ((*(_WORD *)&v47 & 0x2000) != 0)
  {
    if ((v48 & 0x2000) == 0 || self->_reportingAdamID != *((void *)v4 + 14)) {
      goto LABEL_294;
    }
  }
  else if ((v48 & 0x2000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v47 & 0x4000) != 0)
  {
    if ((v48 & 0x4000) == 0 || self->_sharedActivityGroupSizeCurrent != *((void *)v4 + 15)) {
      goto LABEL_294;
    }
  }
  else if ((v48 & 0x4000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v47 & 0x8000) != 0)
  {
    if ((v48 & 0x8000) == 0 || self->_sharedActivityGroupSizeMax != *((void *)v4 + 16)) {
      goto LABEL_294;
    }
  }
  else if ((v48 & 0x8000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(void *)&v47 & 0x400000000) != 0)
  {
    if ((v48 & 0x400000000) == 0 || self->_vocalAttenuationAvailibility != *((_DWORD *)v4 + 122)) {
      goto LABEL_294;
    }
  }
  else if ((v48 & 0x400000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v47 & 0x200000) != 0)
  {
    if ((v48 & 0x200000) == 0 || self->_vocalAttenuationDuration != *((double *)v4 + 22)) {
      goto LABEL_294;
    }
  }
  else if ((v48 & 0x200000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(void *)&v47 & 0x800000000) != 0)
  {
    if ((v48 & 0x800000000) == 0) {
      goto LABEL_294;
    }
    if (self->_continuityCameraUsed)
    {
      if (!v4[492]) {
        goto LABEL_294;
      }
    }
    else if (v4[492])
    {
      goto LABEL_294;
    }
  }
  else if ((v48 & 0x800000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(void *)&v47 & 0x2000000000) == 0)
  {
    if ((v48 & 0x2000000000) == 0) {
      goto LABEL_289;
    }
LABEL_294:
    BOOL v49 = 0;
    goto LABEL_295;
  }
  if ((v48 & 0x2000000000) == 0) {
    goto LABEL_294;
  }
  if (!self->_isCollaborativePlaylist)
  {
    if (!v4[494]) {
      goto LABEL_289;
    }
    goto LABEL_294;
  }
  if (!v4[494]) {
    goto LABEL_294;
  }
LABEL_289:
  if ((*(_DWORD *)&v47 & 0x80000000) != 0)
  {
    if ((v48 & 0x80000000) == 0 || self->_sharedActivityType != *((_DWORD *)v4 + 104)) {
      goto LABEL_294;
    }
    BOOL v49 = 1;
  }
  else
  {
    BOOL v49 = (int)v48 >= 0;
  }
LABEL_295:

  return v49;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_containerID copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v6;

  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 224) = self->_containerType;
    *(void *)(v5 + 500) |= 0x800000uLL;
  }
  uint64_t v8 = [(NSString *)self->_deviceName copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v8;

  $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    *(_DWORD *)(v5 + 244) = self->_endReasonType;
    *(void *)(v5 + 500) |= 0x2000000uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 40) = self->_eventDateTimestamp;
  *(void *)(v5 + 500) |= 0x10uLL;
  if ((*(void *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(double *)(v5 + 48) = self->_eventSecondsFromGMT;
    *(void *)(v5 + 500) |= 0x20uLL;
  }
LABEL_7:
  uint64_t v11 = [(NSString *)self->_externalID copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v11;

  uint64_t v13 = [(NSString *)self->_featureName copyWithZone:a3];
  $1C24819EE6FCB6BF7661081CD3A68180 v14 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v13;

  $1C24819EE6FCB6BF7661081CD3A68180 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_itemDuration;
    *(void *)(v5 + 500) |= 0x80uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x100) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v15 & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v15 & 0x100) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 72) = self->_itemEndTime;
  *(void *)(v5 + 500) |= 0x100uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&v15 & 0x8000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(double *)(v5 + 80) = self->_itemStartTime;
  *(void *)(v5 + 500) |= 0x200uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v15 & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 304) = self->_itemType;
  *(void *)(v5 + 500) |= 0x8000000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(void *)&v15 & 0x4000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 328) = self->_mediaType;
  *(void *)(v5 + 500) |= 0x10000000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v15 = self->_has;
  if ((*(void *)&v15 & 0x4000000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v15 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_75:
  *(unsigned char *)(v5 + 495) = self->_offline;
  *(void *)(v5 + 500) |= 0x4000000000uLL;
  if ((*(void *)&self->_has & 0x400) != 0)
  {
LABEL_14:
    *(void *)(v5 + 88) = self->_persistentID;
    *(void *)(v5 + 500) |= 0x400uLL;
  }
LABEL_15:
  uint64_t v16 = [(NSString *)self->_personalizedContainerID copyWithZone:a3];
  double v17 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v16;

  $1C24819EE6FCB6BF7661081CD3A68180 v18 = self->_has;
  if ((*(void *)&v18 & 0x10000000000) != 0)
  {
    *(unsigned char *)(v5 + 497) = self->_sBEnabled;
    *(void *)(v5 + 500) |= 0x10000000000uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v18 = self->_has;
    if ((*(void *)&v18 & 0x100000000) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&v18 & 0x20000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(void *)&v18 & 0x100000000) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 420) = self->_sourceType;
  *(void *)(v5 + 500) |= 0x100000000uLL;
  if ((*(void *)&self->_has & 0x20000) != 0)
  {
LABEL_18:
    *(void *)(v5 + 144) = self->_storeAccountID;
    *(void *)(v5 + 500) |= 0x20000uLL;
  }
LABEL_19:
  uint64_t v19 = [(NSString *)self->_storeID copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v19;

  uint64_t v21 = [(NSData *)self->_timedMetadata copyWithZone:a3];
  double v22 = *(void **)(v5 + 472);
  *(void *)(v5 + 472) = v21;

  uint64_t v23 = [(NSData *)self->_trackInfo copyWithZone:a3];
  double v24 = *(void **)(v5 + 480);
  *(void *)(v5 + 480) = v23;

  uint64_t v25 = [(NSData *)self->_recommendationData copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v25;

  uint64_t v27 = [(NSString *)self->_storeFrontID copyWithZone:a3];
  long double v28 = *(void **)(v5 + 440);
  *(void *)(v5 + 440) = v27;

  $1C24819EE6FCB6BF7661081CD3A68180 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x4000000) != 0)
  {
    *(_DWORD *)(v5 + 264) = self->_eventType;
    *(void *)(v5 + 500) |= 0x4000000uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v29 = self->_has;
    if ((*(_DWORD *)&v29 & 0x40000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v29 & 0x800) == 0) {
        goto LABEL_22;
      }
      goto LABEL_82;
    }
  }
  else if ((*(_DWORD *)&v29 & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  *(void *)(v5 + 152) = self->_subscriptionAdamID;
  *(void *)(v5 + 500) |= 0x40000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v29 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(void *)(v5 + 96) = self->_purchasedAdamID;
  *(void *)(v5 + 500) |= 0x800uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v29 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_83:
  *(void *)(v5 + 104) = self->_radioAdamID;
  *(void *)(v5 + 500) |= 0x1000uLL;
  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_24:
    *(void *)(v5 + 56) = self->_itemCloudID;
    *(void *)(v5 + 500) |= 0x40uLL;
  }
LABEL_25:
  uint64_t v30 = [(NSString *)self->_lyricsID copyWithZone:a3];
  $1C24819EE6FCB6BF7661081CD3A68180 v31 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v30;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_containerAdamID;
    *(void *)(v5 + 500) |= 4uLL;
  }
  uint64_t v32 = [(NSString *)self->_globalPlaylistID copyWithZone:a3];
  uint64_t v33 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v32;

  uint64_t v34 = [(NSString *)self->_stationHash copyWithZone:a3];
  $1C24819EE6FCB6BF7661081CD3A68180 v35 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v34;

  uint64_t v36 = [(NSString *)self->_stationStringID copyWithZone:a3];
  uint64_t v37 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v36;

  if (*((unsigned char *)&self->_has + 2))
  {
    *(void *)(v5 + 136) = self->_stationID;
    *(void *)(v5 + 500) |= 0x10000uLL;
  }
  uint64_t v38 = [(NSString *)self->_cloudAlbumID copyWithZone:a3];
  uint64_t v39 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v38;

  $1C24819EE6FCB6BF7661081CD3A68180 v40 = self->_has;
  if ((*(unsigned char *)&v40 & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_cloudPlaylistID;
    *(void *)(v5 + 500) |= 2uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v40 = self->_has;
  }
  if ((*(_DWORD *)&v40 & 0x40000000) != 0)
  {
    *(_DWORD *)(v5 + 384) = self->_reasonHintType;
    *(void *)(v5 + 500) |= 0x40000000uLL;
  }
  uint64_t v41 = [(NSString *)self->_buildVersion copyWithZone:a3];
  $1C24819EE6FCB6BF7661081CD3A68180 v42 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v41;

  uint64_t v43 = [(NSString *)self->_playlistVersionHash copyWithZone:a3];
  double v44 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v43;

  uint64_t v45 = [(NSString *)self->_requestingBundleIdentifier copyWithZone:a3];
  double v46 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v45;

  uint64_t v47 = [(NSString *)self->_requestingBundleVersion copyWithZone:a3];
  uint64_t v48 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v47;

  $1C24819EE6FCB6BF7661081CD3A68180 v49 = self->_has;
  if ((*(unsigned char *)&v49 & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_equivalencySourceAdamID;
    *(void *)(v5 + 500) |= 8uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v49 = self->_has;
    if ((*(void *)&v49 & 0x1000000000) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v49 & 0x80000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_87;
    }
  }
  else if ((*(void *)&v49 & 0x1000000000) == 0)
  {
    goto LABEL_35;
  }
  *(unsigned char *)(v5 + 493) = self->_internalBuild;
  *(void *)(v5 + 500) |= 0x1000000000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x80000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v49 & 0x100000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_87:
  *(void *)(v5 + 160) = self->_tvShowPurchasedAdamID;
  *(void *)(v5 + 500) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x100000) != 0)
  {
LABEL_37:
    *(void *)(v5 + 168) = self->_tvShowSubscriptionAdamID;
    *(void *)(v5 + 500) |= 0x100000uLL;
  }
LABEL_38:
  id v50 = [(ICPAPlayActivityEnqueuerProperties *)self->_enqueuerProperties copyWithZone:a3];
  v51 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v50;

  uint64_t v52 = [(NSString *)self->_householdID copyWithZone:a3];
  unint64_t v53 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v52;

  $1C24819EE6FCB6BF7661081CD3A68180 v54 = self->_has;
  if ((*(void *)&v54 & 0x8000000000) != 0)
  {
    *(unsigned char *)(v5 + 496) = self->_privateListeningEnabled;
    *(void *)(v5 + 500) |= 0x8000000000uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v54 = self->_has;
    if ((*(void *)&v54 & 0x20000000000) == 0)
    {
LABEL_40:
      if ((*(void *)&v54 & 0x200000000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
  }
  else if ((*(void *)&v54 & 0x20000000000) == 0)
  {
    goto LABEL_40;
  }
  *(unsigned char *)(v5 + 498) = self->_siriInitiated;
  *(void *)(v5 + 500) |= 0x20000000000uLL;
  if ((*(void *)&self->_has & 0x200000000) != 0)
  {
LABEL_41:
    *(_DWORD *)(v5 + 456) = self->_systemReleaseType;
    *(void *)(v5 + 500) |= 0x200000000uLL;
  }
LABEL_42:
  uint64_t v55 = [(NSString *)self->_eventTimeZoneName copyWithZone:a3];
  unint64_t v56 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v55;

  $1C24819EE6FCB6BF7661081CD3A68180 v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x1000000) != 0)
  {
    *(_DWORD *)(v5 + 240) = self->_displayType;
    *(void *)(v5 + 500) |= 0x1000000uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v57 = self->_has;
  }
  if (*(unsigned char *)&v57)
  {
    *(void *)(v5 + 8) = self->_characterDisplayedCount;
    *(void *)(v5 + 500) |= 1uLL;
  }
  uint64_t v58 = [(NSString *)self->_lyricLanguage copyWithZone:a3];
  uint64_t v59 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v58;

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v60 = self->_buildFeatures;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v78 objects:v82 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v79;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v79 != v63) {
          objc_enumerationMutation(v60);
        }
        NSUInteger v65 = objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * v64), "copyWithZone:", a3, (void)v78);
        -[ICPAPlayActivityEvent addBuildFeatures:](v5, v65);

        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v78 objects:v82 count:16];
    }
    while (v62);
  }

  id v66 = [(ICPAPlayModeDictionary *)self->_playMode copyWithZone:a3];
  uint64_t v67 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v66;

  $1C24819EE6FCB6BF7661081CD3A68180 v68 = self->_has;
  if ((*(_DWORD *)&v68 & 0x400000) != 0)
  {
    *(_DWORD *)(v5 + 184) = self->_audioQualityPreference;
    *(void *)(v5 + 500) |= 0x400000uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v68 = self->_has;
  }
  if ((*(_DWORD *)&v68 & 0x20000000) != 0)
  {
    *(_DWORD *)(v5 + 352) = self->_playbackFormatPreference;
    *(void *)(v5 + 500) |= 0x20000000uLL;
  }
  id v69 = -[ICPAAudioQualityDictionary copyWithZone:](self->_targetedAudioQuality, "copyWithZone:", a3, (void)v78);
  uint64_t v70 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = v69;

  id v71 = [(ICPAAudioQualityDictionary *)self->_providedAudioQuality copyWithZone:a3];
  NSUInteger v72 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v71;

  uint64_t v73 = [(NSString *)self->_queueGroupingID copyWithZone:a3];
  NSUInteger v74 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v73;

  $1C24819EE6FCB6BF7661081CD3A68180 v75 = self->_has;
  if ((*(_WORD *)&v75 & 0x2000) != 0)
  {
    *(void *)(v5 + 112) = self->_reportingAdamID;
    *(void *)(v5 + 500) |= 0x2000uLL;
    $1C24819EE6FCB6BF7661081CD3A68180 v75 = self->_has;
    if ((*(_WORD *)&v75 & 0x4000) == 0)
    {
LABEL_59:
      if ((*(_WORD *)&v75 & 0x8000) == 0) {
        goto LABEL_60;
      }
      goto LABEL_94;
    }
  }
  else if ((*(_WORD *)&v75 & 0x4000) == 0)
  {
    goto LABEL_59;
  }
  *(void *)(v5 + 120) = self->_sharedActivityGroupSizeCurrent;
  *(void *)(v5 + 500) |= 0x4000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v75 = self->_has;
  if ((*(_WORD *)&v75 & 0x8000) == 0)
  {
LABEL_60:
    if ((*(void *)&v75 & 0x400000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(void *)(v5 + 128) = self->_sharedActivityGroupSizeMax;
  *(void *)(v5 + 500) |= 0x8000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v75 = self->_has;
  if ((*(void *)&v75 & 0x400000000) == 0)
  {
LABEL_61:
    if ((*(_DWORD *)&v75 & 0x200000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v5 + 488) = self->_vocalAttenuationAvailibility;
  *(void *)(v5 + 500) |= 0x400000000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v75 = self->_has;
  if ((*(_DWORD *)&v75 & 0x200000) == 0)
  {
LABEL_62:
    if ((*(void *)&v75 & 0x800000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(double *)(v5 + 176) = self->_vocalAttenuationDuration;
  *(void *)(v5 + 500) |= 0x200000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v75 = self->_has;
  if ((*(void *)&v75 & 0x800000000) == 0)
  {
LABEL_63:
    if ((*(void *)&v75 & 0x2000000000) == 0) {
      goto LABEL_64;
    }
LABEL_98:
    *(unsigned char *)(v5 + 494) = self->_isCollaborativePlaylist;
    *(void *)(v5 + 500) |= 0x2000000000uLL;
    if ((*(void *)&self->_has & 0x80000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_97:
  *(unsigned char *)(v5 + 492) = self->_continuityCameraUsed;
  *(void *)(v5 + 500) |= 0x800000000uLL;
  $1C24819EE6FCB6BF7661081CD3A68180 v75 = self->_has;
  if ((*(void *)&v75 & 0x2000000000) != 0) {
    goto LABEL_98;
  }
LABEL_64:
  if ((*(_DWORD *)&v75 & 0x80000000) != 0)
  {
LABEL_65:
    *(_DWORD *)(v5 + 416) = self->_sharedActivityType;
    *(void *)(v5 + 500) |= 0x80000000uLL;
  }
LABEL_66:
  id v76 = (id)v5;

  return v76;
}

- (uint64_t)addBuildFeatures:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 192);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v6;

      uint64_t v5 = *(void **)(a1 + 192);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_containerID) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  if ((*(void *)&self->_has & 0x20) != 0) {
LABEL_10:
  }
    PBDataWriterWriteDoubleField();
LABEL_11:
  if (self->_externalID) {
    PBDataWriterWriteStringField();
  }
  if (self->_featureName) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    $1C24819EE6FCB6BF7661081CD3A68180 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x100) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v6 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_126;
    }
  }
  else if ((*(_WORD *)&v6 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteDoubleField();
  $1C24819EE6FCB6BF7661081CD3A68180 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteDoubleField();
  $1C24819EE6FCB6BF7661081CD3A68180 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt32Field();
  $1C24819EE6FCB6BF7661081CD3A68180 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_20:
    if ((*(void *)&v6 & 0x4000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  $1C24819EE6FCB6BF7661081CD3A68180 v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_129:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x400) != 0) {
LABEL_22:
  }
    PBDataWriterWriteInt64Field();
LABEL_23:
  if (self->_personalizedContainerID) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v7 = self->_has;
  if ((*(void *)&v7 & 0x10000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $1C24819EE6FCB6BF7661081CD3A68180 v7 = self->_has;
    if ((*(void *)&v7 & 0x100000000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&v7 & 0x20000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(void *)&v7 & 0x100000000) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x20000) != 0) {
LABEL_28:
  }
    PBDataWriterWriteUint64Field();
LABEL_29:
  if (self->_storeID) {
    PBDataWriterWriteStringField();
  }
  if (self->_timedMetadata) {
    PBDataWriterWriteDataField();
  }
  if (self->_trackInfo) {
    PBDataWriterWriteDataField();
  }
  if (self->_recommendationData) {
    PBDataWriterWriteDataField();
  }
  if (self->_storeFrontID) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $1C24819EE6FCB6BF7661081CD3A68180 v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x40000) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v8 & 0x800) == 0) {
        goto LABEL_42;
      }
      goto LABEL_136;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteInt64Field();
  $1C24819EE6FCB6BF7661081CD3A68180 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteInt64Field();
  $1C24819EE6FCB6BF7661081CD3A68180 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_137:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x40) != 0) {
LABEL_44:
  }
    PBDataWriterWriteUint64Field();
LABEL_45:
  if (self->_lyricsID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_globalPlaylistID) {
    PBDataWriterWriteStringField();
  }
  if (self->_stationHash) {
    PBDataWriterWriteStringField();
  }
  if (self->_stationStringID) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 2)) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_cloudAlbumID) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    $1C24819EE6FCB6BF7661081CD3A68180 v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x40000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_buildVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_playlistVersionHash) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestingBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestingBundleVersion) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    $1C24819EE6FCB6BF7661081CD3A68180 v10 = self->_has;
    if ((*(void *)&v10 & 0x1000000000) == 0)
    {
LABEL_73:
      if ((*(_DWORD *)&v10 & 0x80000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_141;
    }
  }
  else if ((*(void *)&v10 & 0x1000000000) == 0)
  {
    goto LABEL_73;
  }
  PBDataWriterWriteBOOLField();
  $1C24819EE6FCB6BF7661081CD3A68180 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_141:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x100000) != 0) {
LABEL_75:
  }
    PBDataWriterWriteInt64Field();
LABEL_76:
  if (self->_enqueuerProperties) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_householdID) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v11 = self->_has;
  if ((*(void *)&v11 & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $1C24819EE6FCB6BF7661081CD3A68180 v11 = self->_has;
    if ((*(void *)&v11 & 0x20000000000) == 0)
    {
LABEL_82:
      if ((*(void *)&v11 & 0x200000000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((*(void *)&v11 & 0x20000000000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x200000000) != 0) {
LABEL_83:
  }
    PBDataWriterWriteInt32Field();
LABEL_84:
  if (self->_eventTimeZoneName) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $1C24819EE6FCB6BF7661081CD3A68180 v12 = self->_has;
  }
  if (*(unsigned char *)&v12) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_lyricLanguage) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = self->_buildFeatures;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  if (self->_playMode) {
    PBDataWriterWriteSubmessage();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x400000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $1C24819EE6FCB6BF7661081CD3A68180 v18 = self->_has;
  }
  if ((*(_DWORD *)&v18 & 0x20000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_targetedAudioQuality) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_providedAudioQuality) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queueGroupingID) {
    PBDataWriterWriteStringField();
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
    if ((*(_WORD *)&v19 & 0x4000) == 0)
    {
LABEL_113:
      if ((*(_WORD *)&v19 & 0x8000) == 0) {
        goto LABEL_114;
      }
      goto LABEL_148;
    }
  }
  else if ((*(_WORD *)&v19 & 0x4000) == 0)
  {
    goto LABEL_113;
  }
  PBDataWriterWriteInt64Field();
  $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x8000) == 0)
  {
LABEL_114:
    if ((*(void *)&v19 & 0x400000000) == 0) {
      goto LABEL_115;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteInt64Field();
  $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  if ((*(void *)&v19 & 0x400000000) == 0)
  {
LABEL_115:
    if ((*(_DWORD *)&v19 & 0x200000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteInt32Field();
  $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x200000) == 0)
  {
LABEL_116:
    if ((*(void *)&v19 & 0x800000000) == 0) {
      goto LABEL_117;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteDoubleField();
  $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  if ((*(void *)&v19 & 0x800000000) == 0)
  {
LABEL_117:
    if ((*(void *)&v19 & 0x2000000000) == 0) {
      goto LABEL_118;
    }
LABEL_152:
    PBDataWriterWriteBOOLField();
    if ((*(void *)&self->_has & 0x80000000) == 0) {
      goto LABEL_120;
    }
    goto LABEL_119;
  }
LABEL_151:
  PBDataWriterWriteBOOLField();
  $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  if ((*(void *)&v19 & 0x2000000000) != 0) {
    goto LABEL_152;
  }
LABEL_118:
  if ((*(_DWORD *)&v19 & 0x80000000) != 0) {
LABEL_119:
  }
    PBDataWriterWriteInt32Field();
LABEL_120:
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  $1C24819EE6FCB6BF7661081CD3A68180 v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    $1C24819EE6FCB6BF7661081CD3A68180 v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        uint64_t v13 = *(void *)((char *)a3 + v12);
        unint64_t v14 = v13 + 1;
        if (v13 == -1 || v14 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v14;
        v11 |= (unint64_t)(v15 & 0x7F) << v9;
        if ((v15 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v16 = v10++ >= 9;
        if (v16)
        {
          unint64_t v11 = 0;
          int v17 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v17 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v17 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 216;
          goto LABEL_276;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x800000uLL;
          while (2)
          {
            uint64_t v24 = *v4;
            uint64_t v25 = *(void *)((char *)a3 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v25);
              *(void *)((char *)a3 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_332;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_332:
          uint64_t v263 = 224;
          goto LABEL_475;
        case 3u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 232;
          goto LABEL_276;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x2000000uLL;
          while (2)
          {
            uint64_t v30 = *v4;
            uint64_t v31 = *(void *)((char *)a3 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v31);
              *(void *)((char *)a3 + v30) = v32;
              v23 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_336;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_336:
          uint64_t v263 = 244;
          goto LABEL_475;
        case 5u:
          *(void *)&self->_has |= 0x10uLL;
          uint64_t v34 = *v4;
          unint64_t v35 = *(void *)((char *)a3 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)((char *)a3 + *v5))
          {
            uint64_t v36 = *(objc_class **)(*(void *)((char *)a3 + *v8) + v35);
            *(void *)((char *)a3 + v34) = v35 + 8;
          }
          else
          {
            *((unsigned char *)a3 + *v6) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v267 = 40;
          goto LABEL_488;
        case 6u:
          *(void *)&self->_has |= 0x20uLL;
          uint64_t v37 = *v4;
          unint64_t v38 = *(void *)((char *)a3 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(void *)((char *)a3 + *v5))
          {
            uint64_t v36 = *(objc_class **)(*(void *)((char *)a3 + *v8) + v38);
            *(void *)((char *)a3 + v37) = v38 + 8;
          }
          else
          {
            *((unsigned char *)a3 + *v6) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v267 = 48;
          goto LABEL_488;
        case 7u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 272;
          goto LABEL_276;
        case 8u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 280;
          goto LABEL_276;
        case 9u:
          *(void *)&self->_has |= 0x80uLL;
          uint64_t v39 = *v4;
          unint64_t v40 = *(void *)((char *)a3 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)((char *)a3 + *v5))
          {
            uint64_t v36 = *(objc_class **)(*(void *)((char *)a3 + *v8) + v40);
            *(void *)((char *)a3 + v39) = v40 + 8;
          }
          else
          {
            *((unsigned char *)a3 + *v6) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v267 = 64;
          goto LABEL_488;
        case 0xAu:
          *(void *)&self->_has |= 0x100uLL;
          uint64_t v41 = *v4;
          unint64_t v42 = *(void *)((char *)a3 + v41);
          if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(void *)((char *)a3 + *v5))
          {
            uint64_t v36 = *(objc_class **)(*(void *)((char *)a3 + *v8) + v42);
            *(void *)((char *)a3 + v41) = v42 + 8;
          }
          else
          {
            *((unsigned char *)a3 + *v6) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v267 = 72;
          goto LABEL_488;
        case 0xBu:
          *(void *)&self->_has |= 0x200uLL;
          uint64_t v43 = *v4;
          unint64_t v44 = *(void *)((char *)a3 + v43);
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(void *)((char *)a3 + *v5))
          {
            uint64_t v36 = *(objc_class **)(*(void *)((char *)a3 + *v8) + v44);
            *(void *)((char *)a3 + v43) = v44 + 8;
          }
          else
          {
            *((unsigned char *)a3 + *v6) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v267 = 80;
          goto LABEL_488;
        case 0xCu:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x8000000uLL;
          while (2)
          {
            uint64_t v47 = *v4;
            uint64_t v48 = *(void *)((char *)a3 + v47);
            unint64_t v49 = v48 + 1;
            if (v48 == -1 || v49 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v48);
              *(void *)((char *)a3 + v47) = v49;
              v23 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                BOOL v16 = v46++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_340;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_340:
          uint64_t v263 = 304;
          goto LABEL_475;
        case 0xDu:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x10000000uLL;
          while (2)
          {
            uint64_t v53 = *v4;
            uint64_t v54 = *(void *)((char *)a3 + v53);
            unint64_t v55 = v54 + 1;
            if (v54 == -1 || v55 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v56 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v54);
              *(void *)((char *)a3 + v53) = v55;
              v23 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                BOOL v16 = v52++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_344;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_344:
          uint64_t v263 = 328;
          goto LABEL_475;
        case 0xEu:
          char v57 = 0;
          unsigned int v58 = 0;
          uint64_t v59 = 0;
          *(void *)&self->_has |= 0x4000000000uLL;
          while (2)
          {
            uint64_t v60 = *v4;
            uint64_t v61 = *(void *)((char *)a3 + v60);
            unint64_t v62 = v61 + 1;
            if (v61 == -1 || v62 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v63 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v61);
              *(void *)((char *)a3 + v60) = v62;
              v59 |= (unint64_t)(v63 & 0x7F) << v57;
              if (v63 < 0)
              {
                v57 += 7;
                BOOL v16 = v58++ >= 9;
                if (v16)
                {
                  uint64_t v59 = 0;
                  goto LABEL_348;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v59 = 0;
          }
LABEL_348:
          BOOL v264 = v59 != 0;
          uint64_t v265 = 495;
          goto LABEL_470;
        case 0xFu:
          char v64 = 0;
          unsigned int v65 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x400uLL;
          while (2)
          {
            uint64_t v67 = *v4;
            uint64_t v68 = *(void *)((char *)a3 + v67);
            unint64_t v69 = v68 + 1;
            if (v68 == -1 || v69 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v70 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v68);
              *(void *)((char *)a3 + v67) = v69;
              v66 |= (unint64_t)(v70 & 0x7F) << v64;
              if (v70 < 0)
              {
                v64 += 7;
                BOOL v16 = v65++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_352;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_352:
          uint64_t v266 = 88;
          goto LABEL_457;
        case 0x10u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 336;
          goto LABEL_276;
        case 0x11u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v73 = 0;
          *(void *)&self->_has |= 0x10000000000uLL;
          while (2)
          {
            uint64_t v74 = *v4;
            uint64_t v75 = *(void *)((char *)a3 + v74);
            unint64_t v76 = v75 + 1;
            if (v75 == -1 || v76 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v77 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v75);
              *(void *)((char *)a3 + v74) = v76;
              v73 |= (unint64_t)(v77 & 0x7F) << v71;
              if (v77 < 0)
              {
                v71 += 7;
                BOOL v16 = v72++ >= 9;
                if (v16)
                {
                  uint64_t v73 = 0;
                  goto LABEL_356;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v73 = 0;
          }
LABEL_356:
          BOOL v264 = v73 != 0;
          uint64_t v265 = 497;
          goto LABEL_470;
        case 0x12u:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x100000000uLL;
          while (2)
          {
            uint64_t v80 = *v4;
            uint64_t v81 = *(void *)((char *)a3 + v80);
            unint64_t v82 = v81 + 1;
            if (v81 == -1 || v82 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v83 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v81);
              *(void *)((char *)a3 + v80) = v82;
              v23 |= (unint64_t)(v83 & 0x7F) << v78;
              if (v83 < 0)
              {
                v78 += 7;
                BOOL v16 = v79++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_360;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_360:
          uint64_t v263 = 420;
          goto LABEL_475;
        case 0x13u:
          char v84 = 0;
          unsigned int v85 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x20000uLL;
          while (2)
          {
            uint64_t v86 = *v4;
            uint64_t v87 = *(void *)((char *)a3 + v86);
            unint64_t v88 = v87 + 1;
            if (v87 == -1 || v88 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v89 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v87);
              *(void *)((char *)a3 + v86) = v88;
              v66 |= (unint64_t)(v89 & 0x7F) << v84;
              if (v89 < 0)
              {
                v84 += 7;
                BOOL v16 = v85++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_364;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_364:
          uint64_t v266 = 144;
          goto LABEL_457;
        case 0x14u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 448;
          goto LABEL_276;
        case 0x15u:
          PBReaderReadData();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 472;
          goto LABEL_276;
        case 0x16u:
          PBReaderReadData();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 480;
          goto LABEL_276;
        case 0x17u:
          PBReaderReadData();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 392;
          goto LABEL_276;
        case 0x18u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 440;
          goto LABEL_276;
        case 0x19u:
          char v90 = 0;
          unsigned int v91 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x4000000uLL;
          while (2)
          {
            uint64_t v92 = *v4;
            uint64_t v93 = *(void *)((char *)a3 + v92);
            unint64_t v94 = v93 + 1;
            if (v93 == -1 || v94 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v95 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v93);
              *(void *)((char *)a3 + v92) = v94;
              v23 |= (unint64_t)(v95 & 0x7F) << v90;
              if (v95 < 0)
              {
                v90 += 7;
                BOOL v16 = v91++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_368;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_368:
          uint64_t v263 = 264;
          goto LABEL_475;
        case 0x1Au:
          char v96 = 0;
          unsigned int v97 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x40000uLL;
          while (2)
          {
            uint64_t v98 = *v4;
            uint64_t v99 = *(void *)((char *)a3 + v98);
            unint64_t v100 = v99 + 1;
            if (v99 == -1 || v100 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v101 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v99);
              *(void *)((char *)a3 + v98) = v100;
              v66 |= (unint64_t)(v101 & 0x7F) << v96;
              if (v101 < 0)
              {
                v96 += 7;
                BOOL v16 = v97++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_372;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_372:
          uint64_t v266 = 152;
          goto LABEL_457;
        case 0x1Bu:
          char v102 = 0;
          unsigned int v103 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x800uLL;
          while (2)
          {
            uint64_t v104 = *v4;
            uint64_t v105 = *(void *)((char *)a3 + v104);
            unint64_t v106 = v105 + 1;
            if (v105 == -1 || v106 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v107 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v105);
              *(void *)((char *)a3 + v104) = v106;
              v66 |= (unint64_t)(v107 & 0x7F) << v102;
              if (v107 < 0)
              {
                v102 += 7;
                BOOL v16 = v103++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_376;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_376:
          uint64_t v266 = 96;
          goto LABEL_457;
        case 0x1Cu:
          char v108 = 0;
          unsigned int v109 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x1000uLL;
          while (2)
          {
            uint64_t v110 = *v4;
            uint64_t v111 = *(void *)((char *)a3 + v110);
            unint64_t v112 = v111 + 1;
            if (v111 == -1 || v112 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v113 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v111);
              *(void *)((char *)a3 + v110) = v112;
              v66 |= (unint64_t)(v113 & 0x7F) << v108;
              if (v113 < 0)
              {
                v108 += 7;
                BOOL v16 = v109++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_380;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_380:
          uint64_t v266 = 104;
          goto LABEL_457;
        case 0x1Du:
          char v114 = 0;
          unsigned int v115 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x40uLL;
          while (2)
          {
            uint64_t v116 = *v4;
            uint64_t v117 = *(void *)((char *)a3 + v116);
            unint64_t v118 = v117 + 1;
            if (v117 == -1 || v118 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v119 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v117);
              *(void *)((char *)a3 + v116) = v118;
              v66 |= (unint64_t)(v119 & 0x7F) << v114;
              if (v119 < 0)
              {
                v114 += 7;
                BOOL v16 = v115++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_384;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_384:
          uint64_t v266 = 56;
          goto LABEL_457;
        case 0x1Eu:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 320;
          goto LABEL_276;
        case 0x1Fu:
          char v120 = 0;
          unsigned int v121 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 4uLL;
          while (2)
          {
            uint64_t v122 = *v4;
            uint64_t v123 = *(void *)((char *)a3 + v122);
            unint64_t v124 = v123 + 1;
            if (v123 == -1 || v124 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v125 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v123);
              *(void *)((char *)a3 + v122) = v124;
              v66 |= (unint64_t)(v125 & 0x7F) << v120;
              if (v125 < 0)
              {
                v120 += 7;
                BOOL v16 = v121++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_388;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_388:
          uint64_t v266 = 24;
          goto LABEL_457;
        case 0x20u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 288;
          goto LABEL_276;
        case 0x21u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 424;
          goto LABEL_276;
        case 0x22u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 432;
          goto LABEL_276;
        case 0x23u:
          char v126 = 0;
          unsigned int v127 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x10000uLL;
          while (2)
          {
            uint64_t v128 = *v4;
            uint64_t v129 = *(void *)((char *)a3 + v128);
            unint64_t v130 = v129 + 1;
            if (v129 == -1 || v130 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v131 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v129);
              *(void *)((char *)a3 + v128) = v130;
              v66 |= (unint64_t)(v131 & 0x7F) << v126;
              if (v131 < 0)
              {
                v126 += 7;
                BOOL v16 = v127++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_392;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_392:
          uint64_t v266 = 136;
          goto LABEL_457;
        case 0x24u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 208;
          goto LABEL_276;
        case 0x25u:
          char v132 = 0;
          unsigned int v133 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 2uLL;
          while (2)
          {
            uint64_t v134 = *v4;
            uint64_t v135 = *(void *)((char *)a3 + v134);
            unint64_t v136 = v135 + 1;
            if (v135 == -1 || v136 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v137 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v135);
              *(void *)((char *)a3 + v134) = v136;
              v66 |= (unint64_t)(v137 & 0x7F) << v132;
              if (v137 < 0)
              {
                v132 += 7;
                BOOL v16 = v133++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_396;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_396:
          uint64_t v266 = 16;
          goto LABEL_457;
        case 0x26u:
          char v138 = 0;
          unsigned int v139 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x40000000uLL;
          while (2)
          {
            uint64_t v140 = *v4;
            uint64_t v141 = *(void *)((char *)a3 + v140);
            unint64_t v142 = v141 + 1;
            if (v141 == -1 || v142 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v143 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v141);
              *(void *)((char *)a3 + v140) = v142;
              v23 |= (unint64_t)(v143 & 0x7F) << v138;
              if (v143 < 0)
              {
                v138 += 7;
                BOOL v16 = v139++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_400;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_400:
          uint64_t v263 = 384;
          goto LABEL_475;
        case 0x27u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 200;
          goto LABEL_276;
        case 0x28u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 360;
          goto LABEL_276;
        case 0x29u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 400;
          goto LABEL_276;
        case 0x2Au:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 408;
          goto LABEL_276;
        case 0x2Bu:
          char v144 = 0;
          unsigned int v145 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 8uLL;
          while (2)
          {
            uint64_t v146 = *v4;
            uint64_t v147 = *(void *)((char *)a3 + v146);
            unint64_t v148 = v147 + 1;
            if (v147 == -1 || v148 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v149 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v147);
              *(void *)((char *)a3 + v146) = v148;
              v66 |= (unint64_t)(v149 & 0x7F) << v144;
              if (v149 < 0)
              {
                v144 += 7;
                BOOL v16 = v145++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_404;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_404:
          uint64_t v266 = 32;
          goto LABEL_457;
        case 0x2Cu:
          char v150 = 0;
          unsigned int v151 = 0;
          uint64_t v152 = 0;
          *(void *)&self->_has |= 0x1000000000uLL;
          while (2)
          {
            uint64_t v153 = *v4;
            uint64_t v154 = *(void *)((char *)a3 + v153);
            unint64_t v155 = v154 + 1;
            if (v154 == -1 || v155 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v156 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v154);
              *(void *)((char *)a3 + v153) = v155;
              v152 |= (unint64_t)(v156 & 0x7F) << v150;
              if (v156 < 0)
              {
                v150 += 7;
                BOOL v16 = v151++ >= 9;
                if (v16)
                {
                  uint64_t v152 = 0;
                  goto LABEL_408;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v152 = 0;
          }
LABEL_408:
          BOOL v264 = v152 != 0;
          uint64_t v265 = 493;
          goto LABEL_470;
        case 0x2Du:
          char v157 = 0;
          unsigned int v158 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x80000uLL;
          while (2)
          {
            uint64_t v159 = *v4;
            uint64_t v160 = *(void *)((char *)a3 + v159);
            unint64_t v161 = v160 + 1;
            if (v160 == -1 || v161 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v162 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v160);
              *(void *)((char *)a3 + v159) = v161;
              v66 |= (unint64_t)(v162 & 0x7F) << v157;
              if (v162 < 0)
              {
                v157 += 7;
                BOOL v16 = v158++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_412;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_412:
          uint64_t v266 = 160;
          goto LABEL_457;
        case 0x2Eu:
          char v163 = 0;
          unsigned int v164 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x100000uLL;
          while (2)
          {
            uint64_t v165 = *v4;
            uint64_t v166 = *(void *)((char *)a3 + v165);
            unint64_t v167 = v166 + 1;
            if (v166 == -1 || v167 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v168 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v166);
              *(void *)((char *)a3 + v165) = v167;
              v66 |= (unint64_t)(v168 & 0x7F) << v163;
              if (v168 < 0)
              {
                v163 += 7;
                BOOL v16 = v164++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_416;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_416:
          uint64_t v266 = 168;
          goto LABEL_457;
        case 0x2Fu:
          v169 = objc_alloc_init(ICPAPlayActivityEnqueuerProperties);
          objc_storeStrong((id *)&self->_enqueuerProperties, v169);
          if (!PBReaderPlaceMark()
            || (ICPAPlayActivityEnqueuerPropertiesReadFrom((uint64_t)v169, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_491;
          }
          goto LABEL_273;
        case 0x30u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 296;
          goto LABEL_276;
        case 0x31u:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v172 = 0;
          *(void *)&self->_has |= 0x8000000000uLL;
          while (2)
          {
            uint64_t v173 = *v4;
            uint64_t v174 = *(void *)((char *)a3 + v173);
            unint64_t v175 = v174 + 1;
            if (v174 == -1 || v175 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v176 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v174);
              *(void *)((char *)a3 + v173) = v175;
              v172 |= (unint64_t)(v176 & 0x7F) << v170;
              if (v176 < 0)
              {
                v170 += 7;
                BOOL v16 = v171++ >= 9;
                if (v16)
                {
                  uint64_t v172 = 0;
                  goto LABEL_420;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v172 = 0;
          }
LABEL_420:
          BOOL v264 = v172 != 0;
          uint64_t v265 = 496;
          goto LABEL_470;
        case 0x32u:
          char v177 = 0;
          unsigned int v178 = 0;
          uint64_t v179 = 0;
          *(void *)&self->_has |= 0x20000000000uLL;
          while (2)
          {
            uint64_t v180 = *v4;
            uint64_t v181 = *(void *)((char *)a3 + v180);
            unint64_t v182 = v181 + 1;
            if (v181 == -1 || v182 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v183 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v181);
              *(void *)((char *)a3 + v180) = v182;
              v179 |= (unint64_t)(v183 & 0x7F) << v177;
              if (v183 < 0)
              {
                v177 += 7;
                BOOL v16 = v178++ >= 9;
                if (v16)
                {
                  uint64_t v179 = 0;
                  goto LABEL_424;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v179 = 0;
          }
LABEL_424:
          BOOL v264 = v179 != 0;
          uint64_t v265 = 498;
          goto LABEL_470;
        case 0x33u:
          char v184 = 0;
          unsigned int v185 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x200000000uLL;
          while (2)
          {
            uint64_t v186 = *v4;
            uint64_t v187 = *(void *)((char *)a3 + v186);
            unint64_t v188 = v187 + 1;
            if (v187 == -1 || v188 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v189 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v187);
              *(void *)((char *)a3 + v186) = v188;
              v23 |= (unint64_t)(v189 & 0x7F) << v184;
              if (v189 < 0)
              {
                v184 += 7;
                BOOL v16 = v185++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_428;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_428:
          uint64_t v263 = 456;
          goto LABEL_475;
        case 0x34u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 256;
          goto LABEL_276;
        case 0x3Du:
          char v191 = 0;
          unsigned int v192 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x1000000uLL;
          while (2)
          {
            uint64_t v193 = *v4;
            uint64_t v194 = *(void *)((char *)a3 + v193);
            unint64_t v195 = v194 + 1;
            if (v194 == -1 || v195 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v196 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v194);
              *(void *)((char *)a3 + v193) = v195;
              v23 |= (unint64_t)(v196 & 0x7F) << v191;
              if (v196 < 0)
              {
                v191 += 7;
                BOOL v16 = v192++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_432;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_432:
          uint64_t v263 = 240;
          goto LABEL_475;
        case 0x56u:
          char v197 = 0;
          unsigned int v198 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 1uLL;
          while (2)
          {
            uint64_t v199 = *v4;
            uint64_t v200 = *(void *)((char *)a3 + v199);
            unint64_t v201 = v200 + 1;
            if (v200 == -1 || v201 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v202 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v200);
              *(void *)((char *)a3 + v199) = v201;
              v66 |= (unint64_t)(v202 & 0x7F) << v197;
              if (v202 < 0)
              {
                v197 += 7;
                BOOL v16 = v198++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_436;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_436:
          uint64_t v266 = 8;
          goto LABEL_457;
        case 0x57u:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 312;
          goto LABEL_276;
        case 0x58u:
          PBReaderReadString();
          v169 = (ICPAPlayActivityEnqueuerProperties *)objc_claimAutoreleasedReturnValue();
          if (v169) {
            -[ICPAPlayActivityEvent addBuildFeatures:]((uint64_t)self, v169);
          }
          goto LABEL_274;
        case 0x59u:
          v169 = objc_alloc_init(ICPAPlayModeDictionary);
          objc_storeStrong((id *)&self->_playMode, v169);
          if (!PBReaderPlaceMark() || !ICPAPlayModeDictionaryReadFrom((uint64_t)v169, (uint64_t)a3)) {
            goto LABEL_491;
          }
          goto LABEL_273;
        case 0x5Au:
          char v203 = 0;
          unsigned int v204 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x400000uLL;
          while (2)
          {
            uint64_t v205 = *v4;
            uint64_t v206 = *(void *)((char *)a3 + v205);
            unint64_t v207 = v206 + 1;
            if (v206 == -1 || v207 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v208 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v206);
              *(void *)((char *)a3 + v205) = v207;
              v23 |= (unint64_t)(v208 & 0x7F) << v203;
              if (v208 < 0)
              {
                v203 += 7;
                BOOL v16 = v204++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_440;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_440:
          uint64_t v263 = 184;
          goto LABEL_475;
        case 0x5Bu:
          char v209 = 0;
          unsigned int v210 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x20000000uLL;
          while (2)
          {
            uint64_t v211 = *v4;
            uint64_t v212 = *(void *)((char *)a3 + v211);
            unint64_t v213 = v212 + 1;
            if (v212 == -1 || v213 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v214 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v212);
              *(void *)((char *)a3 + v211) = v213;
              v23 |= (unint64_t)(v214 & 0x7F) << v209;
              if (v214 < 0)
              {
                v209 += 7;
                BOOL v16 = v210++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_444;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_444:
          uint64_t v263 = 352;
          goto LABEL_475;
        case 0x5Cu:
          v169 = objc_alloc_init(ICPAAudioQualityDictionary);
          uint64_t v215 = 464;
          goto LABEL_271;
        case 0x5Du:
          v169 = objc_alloc_init(ICPAAudioQualityDictionary);
          uint64_t v215 = 368;
LABEL_271:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v215), v169);
          if (!PBReaderPlaceMark()
            || (ICPAAudioQualityDictionaryReadFrom((uint64_t)v169, (uint64_t)a3) & 1) == 0)
          {
LABEL_491:

            LOBYTE(v190) = 0;
            return v190;
          }
LABEL_273:
          PBReaderRecallMark();
LABEL_274:

LABEL_489:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_490;
          }
          break;
        case 0x5Eu:
          PBReaderReadString();
          $1C24819EE6FCB6BF7661081CD3A68180 v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = 376;
LABEL_276:
          v216 = *(Class *)((char *)&self->super.super.isa + v20);
          *(Class *)((char *)&self->super.super.isa + v20) = v19;

          goto LABEL_489;
        case 0x5Fu:
          char v217 = 0;
          unsigned int v218 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x2000uLL;
          while (2)
          {
            uint64_t v219 = *v4;
            uint64_t v220 = *(void *)((char *)a3 + v219);
            unint64_t v221 = v220 + 1;
            if (v220 == -1 || v221 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v222 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v220);
              *(void *)((char *)a3 + v219) = v221;
              v66 |= (unint64_t)(v222 & 0x7F) << v217;
              if (v222 < 0)
              {
                v217 += 7;
                BOOL v16 = v218++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_448;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_448:
          uint64_t v266 = 112;
          goto LABEL_457;
        case 0x60u:
          char v223 = 0;
          unsigned int v224 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x4000uLL;
          while (2)
          {
            uint64_t v225 = *v4;
            uint64_t v226 = *(void *)((char *)a3 + v225);
            unint64_t v227 = v226 + 1;
            if (v226 == -1 || v227 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v228 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v226);
              *(void *)((char *)a3 + v225) = v227;
              v66 |= (unint64_t)(v228 & 0x7F) << v223;
              if (v228 < 0)
              {
                v223 += 7;
                BOOL v16 = v224++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_452;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_452:
          uint64_t v266 = 120;
          goto LABEL_457;
        case 0x61u:
          char v229 = 0;
          unsigned int v230 = 0;
          unint64_t v66 = 0;
          *(void *)&self->_has |= 0x8000uLL;
          while (2)
          {
            uint64_t v231 = *v4;
            uint64_t v232 = *(void *)((char *)a3 + v231);
            unint64_t v233 = v232 + 1;
            if (v232 == -1 || v233 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v234 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v232);
              *(void *)((char *)a3 + v231) = v233;
              v66 |= (unint64_t)(v234 & 0x7F) << v229;
              if (v234 < 0)
              {
                v229 += 7;
                BOOL v16 = v230++ >= 9;
                if (v16)
                {
                  unint64_t v66 = 0;
                  goto LABEL_456;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v66 = 0;
          }
LABEL_456:
          uint64_t v266 = 128;
LABEL_457:
          *(Class *)((char *)&self->super.super.isa + v266) = (Class)v66;
          goto LABEL_489;
        case 0x62u:
          char v235 = 0;
          unsigned int v236 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x400000000uLL;
          while (2)
          {
            uint64_t v237 = *v4;
            uint64_t v238 = *(void *)((char *)a3 + v237);
            unint64_t v239 = v238 + 1;
            if (v238 == -1 || v239 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v240 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v238);
              *(void *)((char *)a3 + v237) = v239;
              v23 |= (unint64_t)(v240 & 0x7F) << v235;
              if (v240 < 0)
              {
                v235 += 7;
                BOOL v16 = v236++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_461;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_461:
          uint64_t v263 = 488;
          goto LABEL_475;
        case 0x63u:
          *(void *)&self->_has |= 0x200000uLL;
          uint64_t v241 = *v4;
          unint64_t v242 = *(void *)((char *)a3 + v241);
          if (v242 <= 0xFFFFFFFFFFFFFFF7 && v242 + 8 <= *(void *)((char *)a3 + *v5))
          {
            uint64_t v36 = *(objc_class **)(*(void *)((char *)a3 + *v8) + v242);
            *(void *)((char *)a3 + v241) = v242 + 8;
          }
          else
          {
            *((unsigned char *)a3 + *v6) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v267 = 176;
LABEL_488:
          *(Class *)((char *)&self->super.super.isa + v267) = v36;
          goto LABEL_489;
        case 0x64u:
          char v243 = 0;
          unsigned int v244 = 0;
          uint64_t v245 = 0;
          *(void *)&self->_has |= 0x800000000uLL;
          while (2)
          {
            uint64_t v246 = *v4;
            uint64_t v247 = *(void *)((char *)a3 + v246);
            unint64_t v248 = v247 + 1;
            if (v247 == -1 || v248 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v249 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v247);
              *(void *)((char *)a3 + v246) = v248;
              v245 |= (unint64_t)(v249 & 0x7F) << v243;
              if (v249 < 0)
              {
                v243 += 7;
                BOOL v16 = v244++ >= 9;
                if (v16)
                {
                  uint64_t v245 = 0;
                  goto LABEL_465;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v245 = 0;
          }
LABEL_465:
          BOOL v264 = v245 != 0;
          uint64_t v265 = 492;
          goto LABEL_470;
        case 0x65u:
          char v250 = 0;
          unsigned int v251 = 0;
          uint64_t v252 = 0;
          *(void *)&self->_has |= 0x2000000000uLL;
          while (2)
          {
            uint64_t v253 = *v4;
            uint64_t v254 = *(void *)((char *)a3 + v253);
            unint64_t v255 = v254 + 1;
            if (v254 == -1 || v255 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v256 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v254);
              *(void *)((char *)a3 + v253) = v255;
              v252 |= (unint64_t)(v256 & 0x7F) << v250;
              if (v256 < 0)
              {
                v250 += 7;
                BOOL v16 = v251++ >= 9;
                if (v16)
                {
                  uint64_t v252 = 0;
                  goto LABEL_469;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v252 = 0;
          }
LABEL_469:
          BOOL v264 = v252 != 0;
          uint64_t v265 = 494;
LABEL_470:
          *((unsigned char *)&self->super.super.isa + v265) = v264;
          goto LABEL_489;
        case 0x66u:
          char v257 = 0;
          unsigned int v258 = 0;
          uint64_t v23 = 0;
          *(void *)&self->_has |= 0x80000000uLL;
          while (2)
          {
            uint64_t v259 = *v4;
            uint64_t v260 = *(void *)((char *)a3 + v259);
            unint64_t v261 = v260 + 1;
            if (v260 == -1 || v261 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v262 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v260);
              *(void *)((char *)a3 + v259) = v261;
              v23 |= (unint64_t)(v262 & 0x7F) << v257;
              if (v262 < 0)
              {
                v257 += 7;
                BOOL v16 = v258++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_474:
          uint64_t v263 = 416;
LABEL_475:
          *(_DWORD *)((char *)&self->super.super.isa + v263) = v23;
          goto LABEL_489;
        default:
          int v190 = PBReaderSkipValueWithTag();
          if (!v190) {
            return v190;
          }
          goto LABEL_489;
      }
    }
  }
LABEL_490:
  LOBYTE(v190) = *((unsigned char *)a3 + *v6) == 0;
  return v190;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    char v63 = [NSNumber numberWithInt:self->_eventType];
    [v3 setObject:v63 forKey:@"eventType"];

    $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
    if ((*(_DWORD *)&has & 0x40000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_118;
    }
  }
  else if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
    goto LABEL_3;
  }
  char v64 = [NSNumber numberWithInt:self->_reasonHintType];
  [v3 setObject:v64 forKey:@"reasonHintType"];

  $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_119;
  }
LABEL_118:
  unsigned int v65 = [NSNumber numberWithLongLong:self->_subscriptionAdamID];
  [v3 setObject:v65 forKey:@"subscriptionAdamID"];

  $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_120;
  }
LABEL_119:
  unint64_t v66 = [NSNumber numberWithLongLong:self->_purchasedAdamID];
  [v3 setObject:v66 forKey:@"purchasedAdamID"];

  $1C24819EE6FCB6BF7661081CD3A68180 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_120:
  uint64_t v67 = [NSNumber numberWithLongLong:self->_radioAdamID];
  [v3 setObject:v67 forKey:@"radioAdamID"];

  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_itemCloudID];
    [v3 setObject:v5 forKey:@"itemCloudID"];
  }
LABEL_8:
  lyricsID = self->_lyricsID;
  if (lyricsID) {
    [v3 setObject:lyricsID forKey:@"lyricsID"];
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
    $1C24819EE6FCB6BF7661081CD3A68180 v8 = [NSNumber numberWithLongLong:self->_equivalencySourceAdamID];
    [v3 setObject:v8 forKey:@"equivalencySourceAdamID"];

    $1C24819EE6FCB6BF7661081CD3A68180 v7 = self->_has;
  }
  if ((*(unsigned char *)&v7 & 4) != 0)
  {
    char v9 = [NSNumber numberWithLongLong:self->_containerAdamID];
    [v3 setObject:v9 forKey:@"containerAdamID"];
  }
  globalPlaylistID = self->_globalPlaylistID;
  if (globalPlaylistID) {
    [v3 setObject:globalPlaylistID forKey:@"globalPlaylistID"];
  }
  stationHash = self->_stationHash;
  if (stationHash) {
    [v3 setObject:stationHash forKey:@"stationHash"];
  }
  stationStringID = self->_stationStringID;
  if (stationStringID) {
    [v3 setObject:stationStringID forKey:@"stationStringID"];
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    uint64_t v13 = [NSNumber numberWithLongLong:self->_stationID];
    [v3 setObject:v13 forKey:@"stationID"];
  }
  cloudAlbumID = self->_cloudAlbumID;
  if (cloudAlbumID) {
    [v3 setObject:cloudAlbumID forKey:@"cloudAlbumID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    char v15 = [NSNumber numberWithUnsignedLongLong:self->_cloudPlaylistID];
    [v3 setObject:v15 forKey:@"cloudPlaylistID"];
  }
  playlistVersionHash = self->_playlistVersionHash;
  if (playlistVersionHash) {
    [v3 setObject:playlistVersionHash forKey:@"playlistVersionHash"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    int v17 = [NSNumber numberWithInt:self->_containerType];
    [v3 setObject:v17 forKey:@"containerType"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x2000000) != 0)
  {
    uint64_t v20 = [NSNumber numberWithInt:self->_endReasonType];
    [v3 setObject:v20 forKey:@"endReasonType"];

    $1C24819EE6FCB6BF7661081CD3A68180 v19 = self->_has;
  }
  if ((*(unsigned char *)&v19 & 0x10) != 0)
  {
    char v21 = [NSNumber numberWithDouble:self->_eventDateTimestamp];
    [v3 setObject:v21 forKey:@"eventDateTimestamp"];
  }
  featureName = self->_featureName;
  if (featureName) {
    [v3 setObject:featureName forKey:@"featureName"];
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
  if ((*(unsigned char *)&v23 & 0x80) != 0)
  {
    uint64_t v68 = [NSNumber numberWithDouble:self->_itemDuration];
    [v3 setObject:v68 forKey:@"itemDuration"];

    $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
    if ((*(_WORD *)&v23 & 0x100) == 0)
    {
LABEL_40:
      if ((*(_WORD *)&v23 & 0x200) == 0) {
        goto LABEL_41;
      }
      goto LABEL_124;
    }
  }
  else if ((*(_WORD *)&v23 & 0x100) == 0)
  {
    goto LABEL_40;
  }
  unint64_t v69 = [NSNumber numberWithDouble:self->_itemEndTime];
  [v3 setObject:v69 forKey:@"itemEndTime"];

  $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x200) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v23 & 0x8000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_125;
  }
LABEL_124:
  char v70 = [NSNumber numberWithDouble:self->_itemStartTime];
  [v3 setObject:v70 forKey:@"itemStartTime"];

  $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x8000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v23 & 0x10000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_126;
  }
LABEL_125:
  char v71 = [NSNumber numberWithInt:self->_itemType];
  [v3 setObject:v71 forKey:@"itemType"];

  $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x10000000) == 0)
  {
LABEL_43:
    if ((*(void *)&v23 & 0x4000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_127;
  }
LABEL_126:
  unsigned int v72 = [NSNumber numberWithInt:self->_mediaType];
  [v3 setObject:v72 forKey:@"mediaType"];

  $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
  if ((*(void *)&v23 & 0x4000000000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v23 & 0x400) == 0) {
      goto LABEL_45;
    }
    goto LABEL_128;
  }
LABEL_127:
  uint64_t v73 = [NSNumber numberWithBool:self->_offline];
  [v3 setObject:v73 forKey:@"offline"];

  $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x400) == 0)
  {
LABEL_45:
    if ((*(void *)&v23 & 0x10000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_129;
  }
LABEL_128:
  uint64_t v74 = [NSNumber numberWithLongLong:self->_persistentID];
  [v3 setObject:v74 forKey:@"persistentID"];

  $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
  if ((*(void *)&v23 & 0x10000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&v23 & 0x100000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_130;
  }
LABEL_129:
  uint64_t v75 = [NSNumber numberWithBool:self->_sBEnabled];
  [v3 setObject:v75 forKey:@"SBEnabled"];

  $1C24819EE6FCB6BF7661081CD3A68180 v23 = self->_has;
  if ((*(void *)&v23 & 0x100000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v23 & 0x20000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_130:
  unint64_t v76 = [NSNumber numberWithInt:self->_sourceType];
  [v3 setObject:v76 forKey:@"sourceType"];

  if ((*(void *)&self->_has & 0x20000) != 0)
  {
LABEL_48:
    uint64_t v24 = [NSNumber numberWithUnsignedLongLong:self->_storeAccountID];
    [v3 setObject:v24 forKey:@"storeAccountID"];
  }
LABEL_49:
  timedMetadata = self->_timedMetadata;
  if (timedMetadata) {
    [v3 setObject:timedMetadata forKey:@"timedMetadata"];
  }
  trackInfo = self->_trackInfo;
  if (trackInfo) {
    [v3 setObject:trackInfo forKey:@"trackInfo"];
  }
  recommendationData = self->_recommendationData;
  if (recommendationData) {
    [v3 setObject:recommendationData forKey:@"recommendationData"];
  }
  storeFrontID = self->_storeFrontID;
  if (storeFrontID) {
    [v3 setObject:storeFrontID forKey:@"storeFrontID"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v3 setObject:buildVersion forKey:@"buildVersion"];
  }
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if (requestingBundleIdentifier) {
    [v3 setObject:requestingBundleIdentifier forKey:@"requestingBundleIdentifier"];
  }
  requestingBundleVersion = self->_requestingBundleVersion;
  if (requestingBundleVersion) {
    [v3 setObject:requestingBundleVersion forKey:@"requestingBundleVersion"];
  }
  enqueuerProperties = self->_enqueuerProperties;
  if (enqueuerProperties)
  {
    char v33 = [(ICPAPlayActivityEnqueuerProperties *)enqueuerProperties dictionaryRepresentation];
    [v3 setObject:v33 forKey:@"enqueuerProperties"];
  }
  householdID = self->_householdID;
  if (householdID) {
    [v3 setObject:householdID forKey:@"householdID"];
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v35 = self->_has;
  if ((*(void *)&v35 & 0x8000000000) != 0)
  {
    char v77 = [NSNumber numberWithBool:self->_privateListeningEnabled];
    [v3 setObject:v77 forKey:@"privateListeningEnabled"];

    $1C24819EE6FCB6BF7661081CD3A68180 v35 = self->_has;
    if ((*(void *)&v35 & 0x20000000000) == 0)
    {
LABEL_69:
      if ((*(void *)&v35 & 0x200000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_70;
    }
  }
  else if ((*(void *)&v35 & 0x20000000000) == 0)
  {
    goto LABEL_69;
  }
  char v78 = [NSNumber numberWithBool:self->_siriInitiated];
  [v3 setObject:v78 forKey:@"siriInitiated"];

  if ((*(void *)&self->_has & 0x200000000) != 0)
  {
LABEL_70:
    uint64_t v36 = [NSNumber numberWithInt:self->_systemReleaseType];
    [v3 setObject:v36 forKey:@"systemReleaseType"];
  }
LABEL_71:
  eventTimeZoneName = self->_eventTimeZoneName;
  if (eventTimeZoneName) {
    [v3 setObject:eventTimeZoneName forKey:@"eventTimeZoneName"];
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x1000000) != 0)
  {
    uint64_t v39 = [NSNumber numberWithInt:self->_displayType];
    [v3 setObject:v39 forKey:@"displayType"];

    $1C24819EE6FCB6BF7661081CD3A68180 v38 = self->_has;
  }
  if (*(unsigned char *)&v38)
  {
    unint64_t v40 = [NSNumber numberWithLongLong:self->_characterDisplayedCount];
    [v3 setObject:v40 forKey:@"characterDisplayedCount"];
  }
  lyricLanguage = self->_lyricLanguage;
  if (lyricLanguage) {
    [v3 setObject:lyricLanguage forKey:@"lyricLanguage"];
  }
  buildFeatures = self->_buildFeatures;
  if (buildFeatures) {
    [v3 setObject:buildFeatures forKey:@"buildFeatures"];
  }
  playMode = self->_playMode;
  if (playMode)
  {
    unint64_t v44 = [(ICPAPlayModeDictionary *)playMode dictionaryRepresentation];
    [v3 setObject:v44 forKey:@"play_mode"];
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x400000) != 0)
  {
    unsigned int v46 = [NSNumber numberWithInt:self->_audioQualityPreference];
    [v3 setObject:v46 forKey:@"audioQualityPreference"];

    $1C24819EE6FCB6BF7661081CD3A68180 v45 = self->_has;
  }
  if ((*(_DWORD *)&v45 & 0x20000000) != 0)
  {
    uint64_t v47 = [NSNumber numberWithInt:self->_playbackFormatPreference];
    [v3 setObject:v47 forKey:@"playbackFormatPreference"];
  }
  targetedAudioQuality = self->_targetedAudioQuality;
  if (targetedAudioQuality)
  {
    unint64_t v49 = [(ICPAAudioQualityDictionary *)targetedAudioQuality dictionaryRepresentation];
    [v3 setObject:v49 forKey:@"targetedAudioQuality"];
  }
  providedAudioQuality = self->_providedAudioQuality;
  if (providedAudioQuality)
  {
    char v51 = [(ICPAAudioQualityDictionary *)providedAudioQuality dictionaryRepresentation];
    [v3 setObject:v51 forKey:@"providedAudioQuality"];
  }
  queueGroupingID = self->_queueGroupingID;
  if (queueGroupingID) {
    [v3 setObject:queueGroupingID forKey:@"queueGroupingID"];
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v53 = self->_has;
  if ((*(_WORD *)&v53 & 0x2000) != 0)
  {
    unsigned int v79 = [NSNumber numberWithLongLong:self->_reportingAdamID];
    [v3 setObject:v79 forKey:@"reportingAdamID"];

    $1C24819EE6FCB6BF7661081CD3A68180 v53 = self->_has;
    if ((*(_WORD *)&v53 & 0x4000) == 0)
    {
LABEL_95:
      if ((*(_WORD *)&v53 & 0x8000) == 0) {
        goto LABEL_96;
      }
      goto LABEL_137;
    }
  }
  else if ((*(_WORD *)&v53 & 0x4000) == 0)
  {
    goto LABEL_95;
  }
  uint64_t v80 = [NSNumber numberWithLongLong:self->_sharedActivityGroupSizeCurrent];
  [v3 setObject:v80 forKey:@"sharedActivityGroupSizeCurrent"];

  $1C24819EE6FCB6BF7661081CD3A68180 v53 = self->_has;
  if ((*(_WORD *)&v53 & 0x8000) == 0)
  {
LABEL_96:
    if ((*(void *)&v53 & 0x400000000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_138;
  }
LABEL_137:
  uint64_t v81 = [NSNumber numberWithLongLong:self->_sharedActivityGroupSizeMax];
  [v3 setObject:v81 forKey:@"sharedActivityGroupSizeMax"];

  $1C24819EE6FCB6BF7661081CD3A68180 v53 = self->_has;
  if ((*(void *)&v53 & 0x400000000) == 0)
  {
LABEL_97:
    if ((*(_DWORD *)&v53 & 0x200000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_139;
  }
LABEL_138:
  unint64_t v82 = [NSNumber numberWithInt:self->_vocalAttenuationAvailibility];
  [v3 setObject:v82 forKey:@"vocalAttenuationAvailibility"];

  $1C24819EE6FCB6BF7661081CD3A68180 v53 = self->_has;
  if ((*(_DWORD *)&v53 & 0x200000) == 0)
  {
LABEL_98:
    if ((*(void *)&v53 & 0x800000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_140;
  }
LABEL_139:
  char v83 = [NSNumber numberWithDouble:self->_vocalAttenuationDuration];
  [v3 setObject:v83 forKey:@"vocalAttenuationDuration"];

  $1C24819EE6FCB6BF7661081CD3A68180 v53 = self->_has;
  if ((*(void *)&v53 & 0x800000000) == 0)
  {
LABEL_99:
    if ((*(void *)&v53 & 0x2000000000) == 0) {
      goto LABEL_100;
    }
    goto LABEL_141;
  }
LABEL_140:
  char v84 = [NSNumber numberWithBool:self->_continuityCameraUsed];
  [v3 setObject:v84 forKey:@"continuityCameraUsed"];

  $1C24819EE6FCB6BF7661081CD3A68180 v53 = self->_has;
  if ((*(void *)&v53 & 0x2000000000) == 0)
  {
LABEL_100:
    if ((*(_DWORD *)&v53 & 0x80000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_101;
  }
LABEL_141:
  unsigned int v85 = [NSNumber numberWithBool:self->_isCollaborativePlaylist];
  [v3 setObject:v85 forKey:@"isCollaborativePlaylist"];

  if ((*(void *)&self->_has & 0x80000000) != 0)
  {
LABEL_101:
    uint64_t v54 = [NSNumber numberWithInt:self->_sharedActivityType];
    [v3 setObject:v54 forKey:@"sharedActivityType"];
  }
LABEL_102:
  containerID = self->_containerID;
  if (containerID) {
    [v3 setObject:containerID forKey:@"containerID"];
  }
  personalizedContainerID = self->_personalizedContainerID;
  if (personalizedContainerID) {
    [v3 setObject:personalizedContainerID forKey:@"personalizedContainerID"];
  }
  storeID = self->_storeID;
  if (storeID) {
    [v3 setObject:storeID forKey:@"storeID"];
  }
  externalID = self->_externalID;
  if (externalID) {
    [v3 setObject:externalID forKey:@"externalID"];
  }
  $1C24819EE6FCB6BF7661081CD3A68180 v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x80000) != 0)
  {
    uint64_t v86 = [NSNumber numberWithLongLong:self->_tvShowPurchasedAdamID];
    [v3 setObject:v86 forKey:@"tvShowPurchasedAdamID"];

    $1C24819EE6FCB6BF7661081CD3A68180 v59 = self->_has;
    if ((*(_DWORD *)&v59 & 0x100000) == 0)
    {
LABEL_112:
      if ((*(void *)&v59 & 0x1000000000) == 0) {
        goto LABEL_113;
      }
LABEL_145:
      unint64_t v88 = [NSNumber numberWithBool:self->_internalBuild];
      [v3 setObject:v88 forKey:@"internalBuild"];

      if ((*(void *)&self->_has & 0x20) == 0) {
        goto LABEL_115;
      }
      goto LABEL_114;
    }
  }
  else if ((*(_DWORD *)&v59 & 0x100000) == 0)
  {
    goto LABEL_112;
  }
  uint64_t v87 = [NSNumber numberWithLongLong:self->_tvShowSubscriptionAdamID];
  [v3 setObject:v87 forKey:@"tvShowSubscriptionAdamID"];

  $1C24819EE6FCB6BF7661081CD3A68180 v59 = self->_has;
  if ((*(void *)&v59 & 0x1000000000) != 0) {
    goto LABEL_145;
  }
LABEL_113:
  if ((*(unsigned char *)&v59 & 0x20) != 0)
  {
LABEL_114:
    uint64_t v60 = [NSNumber numberWithDouble:self->_eventSecondsFromGMT];
    [v3 setObject:v60 forKey:@"eventSecondsFromGMT"];
  }
LABEL_115:
  id v61 = v3;

  return v61;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICPAPlayActivityEvent;
  id v4 = [(ICPAPlayActivityEvent *)&v8 description];
  uint64_t v5 = [(ICPAPlayActivityEvent *)self dictionaryRepresentation];
  $1C24819EE6FCB6BF7661081CD3A68180 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end