@interface BRCNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationFromItem:(id)a3;
+ (id)notificationGatheredFromItem:(id)a3;
- (BOOL)canMerge:(id)a3;
- (BOOL)isDocumentsFolder;
- (BOOL)isInDataScope;
- (BOOL)isInDocumentScope;
- (BOOL)isInTrashScope;
- (BRCAppLibrary)appLibrary;
- (BRCItemGlobalID)itemGlobalID;
- (BRCItemGlobalID)parentGlobalID;
- (BRCNotification)initWithLocalItem:(id)a3 itemDiffs:(unint64_t)a4;
- (BRFileObjectID)oldParentFileObjectID;
- (Class)classForCoder;
- (NSSet)parentGlobalIDs;
- (NSString)aliasSourceAppLibraryID;
- (NSString)oldAppLibraryID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initRootContainerNotificationWithSessionContext:(id)a3;
- (id)notificationByStrippingSharingInfoIfNeeded;
- (id)subclassDescription;
- (void)generateLogicalExtension:(id)a3 physicalExtension:(id)a4;
- (void)markAsLoserVersionWithEtag:(id)a3 modificationDate:(id)a4 editorNameComponents:(id)a5 lastEditorDeviceName:(id)a6 size:(id)a7;
- (void)merge:(id)a3;
- (void)setNumberAttribute:(id)a3 forKey:(id)a4;
- (void)setParentGlobalIDs:(id)a3;
@end

@implementation BRCNotification

- (id)subclassDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = v3;
  if (self->_itemGlobalID) {
    [v3 appendFormat:@" i:%@", self->_itemGlobalID];
  }
  if (self->_parentGlobalID) {
    [v4 appendFormat:@" parent-id:%@", self->_parentGlobalID];
  }
  uint64_t v5 = (int)*MEMORY[0x263F32730];
  if (*(Class *)((char *)&self->super.super.isa + v5))
  {
    v6 = [[BRFieldStructureSignature alloc] initWithData:*(Class *)((char *)&self->super.super.isa + v5)];
    [v4 appendFormat:@" %@", v6];
  }
  uint64_t v7 = (int)*MEMORY[0x263F326A0];
  if (*(Class *)((char *)&self->super.super.isa + v7))
  {
    v8 = [[BRFieldContentSignature alloc] initWithData:*(Class *)((char *)&self->super.super.isa + v7)];
    [v4 appendFormat:@" %@", v8];
  }
  v9 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F326B0]);
  if (v9)
  {
    v10 = objc_msgSend(v9, "br_transform:", &__block_literal_global_3);
    v11 = [v10 componentsJoinedByString:@", "];
    [v4 appendFormat:@" eqVersions:{%@}", v11];
  }
  if (self->_isInDataScope) {
    [v4 appendFormat:@" sc:data"];
  }
  if (self->_isInDocumentScope) {
    [v4 appendFormat:@" sc:docs"];
  }
  if (self->_isInTrashScope) {
    [v4 appendFormat:@" sc:trash"];
  }
  v12 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F326F8]);
  if (v12 && ([v12 isEqualToFileObjectID:self->_oldParentFileObjectID] & 1) == 0) {
    [v4 appendFormat:@" old-pino:%@", self->_oldParentFileObjectID];
  }
  if (self->_aliasSourceAppLibraryID) {
    [v4 appendFormat:@" alias-container:%@", self->_aliasSourceAppLibraryID];
  }
  if (self->_oldAppLibraryID) {
    [v4 appendFormat:@" old-ct:%@", self->_oldAppLibraryID];
  }
  return v4;
}

id __38__BRCNotification_subclassDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[BRFieldContentSignature alloc] initWithData:v2];

  v4 = [(BRFieldContentSignature(BRAdditions) *)v3 description];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRCNotification;
  v4 = [(BRCNotification *)&v7 copyWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 40, self->_itemGlobalID);
    objc_storeStrong(v5 + 37, self->_oldParentFileObjectID);
    objc_storeStrong(v5 + 41, self->_parentGlobalIDs);
    objc_storeStrong(v5 + 35, self->_appLibrary);
    objc_storeStrong(v5 + 36, self->_parentGlobalID);
    objc_storeStrong(v5 + 38, self->_aliasSourceAppLibraryID);
  }
  return v5;
}

- (BRCNotification)initWithLocalItem:(id)a3 itemDiffs:(unint64_t)a4
{
  uint64_t v351 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([v7 isBRAlias])
  {
    id v311 = v7;
    v312 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCNotification initWithLocalItem:itemDiffs:].cold.7();
    }

    id v7 = v311;
  }
  v339.receiver = self;
  v339.super_class = (Class)BRCNotification;
  v8 = [(BRCNotification *)&v339 init];

  if (v8)
  {
    uint64_t v9 = [v7 orig];
    if ([v7 isZoneRoot])
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [v7 st];
    }
    v329 = (void *)v9;
    v325 = [v7 session];
    char v11 = [v7 isOnDisk];
    *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x263F326E0]) = (Class)-1;
    *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x263F32710]) = (Class)-1;
    uint64_t v12 = [v7 appLibrary];
    appLibrary = v8->_appLibrary;
    v8->_appLibrary = (BRCAppLibrary *)v12;

    uint64_t v14 = [(BRCAppLibrary *)v8->_appLibrary appLibraryID];
    uint64_t v15 = (int)*MEMORY[0x263F32668];
    v16 = *(Class *)((char *)&v8->super.super.isa + v15);
    *(Class *)((char *)&v8->super.super.isa + v15) = (Class)v14;

    uint64_t v17 = [v7 itemGlobalID];
    itemGlobalID = v8->_itemGlobalID;
    v8->_itemGlobalID = (BRCItemGlobalID *)v17;

    uint64_t v19 = [v7 itemParentGlobalID];
    parentGlobalID = v8->_parentGlobalID;
    v8->_parentGlobalID = (BRCItemGlobalID *)v19;

    if (v10)
    {
      [v10 logicalName];
    }
    else
    {
      v4 = [(BRCAppLibrary *)v8->_appLibrary mangledID];
      [v4 mangledIDString];
    v21 = };
    id v22 = v10;
    v23 = (id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x263F326E8]);
    objc_storeStrong(v23, v21);
    v330 = v22;
    if (!v22)
    {

      v21 = v4;
    }

    id v24 = *v23;
    v25 = v22;
    if (!v24)
    {
      v313 = brc_bread_crumbs();
      v314 = brc_default_log();
      if (os_log_type_enabled(v314, OS_LOG_TYPE_FAULT)) {
        -[BRCNotification initWithLocalItem:itemDiffs:].cold.6();
      }
    }
    v8->_isInDocumentScope = [v7 isInDocumentScope];
    v8->_isInDataScope = [v7 isInDataScope];
    v8->_isInTrashScope = [v7 isInTrashScope];
    v26 = [v7 parentClientZone];
    uint64_t v27 = [v26 dbRowID];
    uint64_t v28 = (int)*MEMORY[0x263F32708];
    v29 = *(Class *)((char *)&v8->super.super.isa + v28);
    *(Class *)((char *)&v8->super.super.isa + v28) = (Class)v27;

    v30 = [v7 clientZone];
    uint64_t v31 = [v30 dbRowID];
    uint64_t v32 = (int)*MEMORY[0x263F32748];
    v33 = *(Class *)((char *)&v8->super.super.isa + v32);
    *(Class *)((char *)&v8->super.super.isa + v32) = (Class)v31;

    if (([v329 isFSRoot] & 1) == 0)
    {
      uint64_t v34 = [v329 parentFileObjectID];
      oldParentFileObjectID = v8->_oldParentFileObjectID;
      v8->_oldParentFileObjectID = (BRFileObjectID *)v34;
    }
    v36 = [v329 appLibrary];
    v332 = v8;
    v37 = v8->_appLibrary;
    v38 = v36;
    v39 = v37;
    if (v38 == v39)
    {

      p_isa = (NSString *)&v38->super.isa;
      v42 = v332;
      v43 = v329;
    }
    else
    {
      v40 = v39;
      if (v39)
      {
        BOOL v41 = [(BRCAppLibrary *)v38 isEqual:v39];

        v42 = v332;
        v43 = v329;
        if (v41)
        {
LABEL_22:
          v324 = v38;
          int v46 = [v7 fromReadOnlyDB];
          v47 = (unsigned int *)((char *)v42 + (int)*MEMORY[0x263F326C8]);
          uint64_t v48 = 0x100000;
          if (!v46) {
            uint64_t v48 = 0;
          }
          unint64_t v49 = *v47 & 0xFFEFFFCF | ((unint64_t)*((unsigned __int8 *)v47 + 4) << 32) | v48;
          unint64_t v328 = a4;
          v331 = (unsigned int *)((char *)v42 + (int)*MEMORY[0x263F326C8]);
          if (v11)
          {
            unsigned int *v47 = *v47 & 0xFFEFFFCF | v48;
            *((unsigned char *)v47 + 4) = BYTE4(v49);
            uint64_t v50 = [v7 fileObjectID];
            uint64_t v51 = (int)*MEMORY[0x263F326C0];
            v52 = *(Class *)((char *)&v42->super.super.isa + v51);
            *(Class *)((char *)&v42->super.super.isa + v51) = (Class)v50;

            v53 = v47;
            if (([v7 isFSRoot] & 1) == 0)
            {
              uint64_t v54 = [v7 parentFileObjectID];
              uint64_t v55 = (int)*MEMORY[0x263F326F8];
              v56 = *(Class *)((char *)&v42->super.super.isa + v55);
              *(Class *)((char *)&v42->super.super.isa + v55) = (Class)v54;

              if (([v7 sharingOptions] & 0x48) != 0)
              {
                if (([v7 sharingOptions] & 4) == 0)
                {
                  v57 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v7);
                  v58 = v57;
                  if (v57)
                  {
                    v59 = objc_msgSend(v57, "brc_shareItemID");
                    v60 = [v7 clientZone];
                    v61 = [v7 db];
                    v62 = [v60 itemByItemID:v59 db:v61];

                    if (!v62)
                    {
                      v321 = brc_bread_crumbs();
                      v322 = brc_default_log();
                      if (os_log_type_enabled(v322, OS_LOG_TYPE_FAULT)) {
                        -[BRCNotification initWithLocalItem:itemDiffs:].cold.5();
                      }

                      v42 = v332;
                    }
                    uint64_t v63 = [v62 fileObjectID];
                    uint64_t v64 = (int)*MEMORY[0x263F32720];
                    v65 = *(Class *)((char *)&v42->super.super.isa + v64);
                    *(Class *)((char *)&v42->super.super.isa + v64) = (Class)v63;

                    a4 = v328;
                    v25 = v22;
                    v53 = v331;
                  }
                  goto LABEL_35;
                }
                uint64_t v68 = [v7 fileObjectID];
                v69 = (int *)MEMORY[0x263F32720];
LABEL_34:
                uint64_t v70 = *v69;
                v58 = *(Class *)((char *)&v42->super.super.isa + v70);
                *(Class *)((char *)&v42->super.super.isa + v70) = (Class)v68;
LABEL_35:
              }
            }
          }
          else
          {
            *((unsigned char *)v47 + 4) = BYTE4(v49);
            unsigned int *v47 = v49 | 0x10;
            uint64_t v66 = [v43 fileObjectID];
            uint64_t v51 = (int)*MEMORY[0x263F326C0];
            v67 = *(Class *)((char *)&v42->super.super.isa + v51);
            *(Class *)((char *)&v42->super.super.isa + v51) = (Class)v66;

            v53 = v47;
            if (([v43 isFSRoot] & 1) == 0)
            {
              uint64_t v68 = [v43 parentFileObjectID];
              v69 = (int *)MEMORY[0x263F326F8];
              goto LABEL_34;
            }
          }
          if (([v7 isDocument] & 1) == 0
            && [*(id *)((char *)&v42->super.super.isa + (int)v51) type] == 2)
          {
            v317 = brc_bread_crumbs();
            v318 = brc_default_log();
            if (os_log_type_enabled(v318, OS_LOG_TYPE_FAULT)) {
              -[BRCNotification initWithLocalItem:itemDiffs:].cold.4();
            }
          }
          v71 = [v25 finderTags];

          if (v71)
          {
            v72 = [BRFieldFinderTags alloc];
            v73 = [v25 finderTags];
            v74 = [(BRFieldFinderTags *)v72 initWithData:v73];

            if (![(BRFieldFinderTags *)v74 tagsCount])
            {
              v315 = brc_bread_crumbs();
              v316 = brc_default_log();
              if (os_log_type_enabled(v316, OS_LOG_TYPE_FAULT)) {
                -[BRCNotification initWithLocalItem:itemDiffs:]();
              }

              v53 = v331;
            }
            v75 = [(BRFieldFinderTags *)v74 tags];
            [(BRCNotification *)v42 setAttribute:v75 forKey:*MEMORY[0x263F327B8]];
          }
          if (v25) {
            char v76 = [v25 mode];
          }
          else {
            char v76 = 1;
          }
          uint64_t v77 = *v53;
          unint64_t v78 = v77 & 0xFFFFFFFFFFF1FFFFLL | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
          unsigned int *v53 = v77 & 0xFFF1FFFF | ((v76 & 7) << 17);
          *((unsigned char *)v53 + 4) = BYTE4(v78);
          if ([v7 isDirectory])
          {
            unint64_t v79 = *v53 & 0xFFF1FFFF | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32) | ((unint64_t)((*v53 >> 17) & 5 | 2) << 17);
            unsigned int *v53 = *v53 & 0xFFF1FFFF | (((*v53 >> 17) & 5 | 2) << 17);
            *((unsigned char *)v53 + 4) = BYTE4(v79);
          }
          uint64_t v80 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v25, "birthtime"));
          uint64_t v81 = (int)*MEMORY[0x263F32678];
          v82 = *(Class *)((char *)&v42->super.super.isa + v81);
          *(Class *)((char *)&v42->super.super.isa + v81) = (Class)v80;

          if ([v7 isInTrashScope])
          {
            v83 = [v7 parentItemOnFS];
            int v84 = [v83 isAppLibraryTrashFolder];
            int v85 = 0x10000;
            if (!v84) {
              int v85 = 0;
            }
            unint64_t v86 = *v53 & 0xFFFEFFFF | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
            unsigned int *v53 = *v53 & 0xFFFEFFFF | v85;
            *((unsigned char *)v53 + 4) = BYTE4(v86);
          }
          else
          {
            uint64_t v87 = *v53;
            unint64_t v88 = v87 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
            unsigned int *v53 = v87 & 0xFFFEFFFF;
            *((unsigned char *)v53 + 4) = BYTE4(v88);
          }
          uint64_t v89 = [v25 lastUsedTime];
          if (v89)
          {
            v90 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v25, "lastUsedTime"));
          }
          else
          {
            v90 = 0;
          }
          objc_storeStrong((id *)((char *)&v42->super.super.isa + (int)*MEMORY[0x263F326D8]), v90);
          if (v89) {

          }
          uint64_t v91 = [v25 favoriteRank];
          if (v91)
          {
            v92 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v25, "favoriteRank"));
          }
          else
          {
            v92 = 0;
          }
          objc_storeStrong((id *)((char *)&v42->super.super.isa + (int)*MEMORY[0x263F326B8]), v92);
          if (v91) {

          }
          uint64_t v93 = [v7 extendedAttributes];
          v94 = (void **)((char *)&v42->super.super.isa + (int)*MEMORY[0x263F32740]);
          v95 = *v94;
          location = v94;
          *v94 = (void *)v93;

          v96 = [v25 creatorRowID];
          uint64_t v97 = [v96 integerValue];

          if (v97)
          {
            v98 = [v25 creatorRowID];
            v99 = [v7 db];
            v100 = +[BRCAccountSessionFPFS nameComponentsForKey:v98 db:v99];

            v53 = v331;
            [(BRCNotification *)v42 setAttribute:v100 forKey:*MEMORY[0x263F32798]];
          }
          else
          {
            [(BRCNotification *)v42 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32790]];
          }
          char v101 = [v7 uploadStatus];
          unint64_t v102 = *v53 & 0xFFFFFFF3 | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
          unsigned int *v53 = *v53 & 0xFFFFFFF3 | (4 * (v101 & 3));
          *((unsigned char *)v53 + 4) = BYTE4(v102);
          v103 = [v7 clientZone];
          int v104 = [v103 isSharedZone];

          uint64_t v105 = [v7 sharingOptions] & 0x48;
          if (!v104)
          {
            char v116 = [v7 sharingOptions];
            if (!v105)
            {
              if (v116)
              {
                char v134 = [v7 sharingOptions];
                unint64_t v135 = *v53 & 0xFFFFC7FF | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
                unint64_t v136 = HIDWORD(v135);
                v137 = v53;
                int v119 = 0;
                int v126 = 0;
                if ((v134 & 2) != 0) {
                  unsigned int v138 = v135 | 0x800;
                }
                else {
                  unsigned int v138 = v135 | 0x1000;
                }
                *((unsigned char *)v137 + 4) = v136;
                unsigned int *v137 = v138;
              }
              else
              {
                int v119 = 0;
                v127 = v53;
                int v126 = 0;
                uint64_t v128 = *v127;
                unint64_t v129 = v128 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v127 + 4) << 32);
                unsigned int *v127 = v128 & 0xFFFFC7FF;
                *((unsigned char *)v127 + 4) = BYTE4(v129);
              }
              goto LABEL_97;
            }
            unint64_t v117 = *v53 & 0xFFFFC7FF | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
            int v118 = 2048;
            if ((v116 & 0x10) == 0) {
              int v118 = 4096;
            }
            unsigned int *v53 = *v53 & 0xFFFFC7FF | v118;
            *((unsigned char *)v53 + 4) = BYTE4(v117);
            int v119 = [v7 isDocument];
            goto LABEL_88;
          }
          if (!v105 && ([v7 isDead] & 1) == 0)
          {
            v106 = brc_bread_crumbs();
            v107 = brc_default_log();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              v108 = [v7 digestDescription];
              v109 = [v7 appLibrary];
              uint64_t v110 = [v7 sharingOptions];
              [v7 sharingOptions];
              BRCPrettyPrintBitmap();
              id v111 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v342 = v108;
              __int16 v343 = 2112;
              v344 = v109;
              __int16 v345 = 2048;
              uint64_t v346 = v110;
              a4 = v328;
              __int16 v347 = 2112;
              id v348 = v111;
              __int16 v349 = 2112;
              v350 = v106;
              _os_log_impl(&dword_23FA42000, v107, OS_LOG_TYPE_DEFAULT, "[WARNING] item %@ in shared zone \"%@\" should have share-options set (actual:%lu %@)%@", buf, 0x34u);

              v25 = v330;
              v53 = v331;
            }
          }
          if (([v7 isShareAcceptationFault] & 1) == 0)
          {
            unsigned int v112 = [v7 sharingOptions];
            if (((([v7 sharingOptions] >> 3) ^ (v112 >> 6)) & 1) == 0
              && ([v7 isDead] & 1) == 0)
            {
              v113 = brc_bread_crumbs();
              v114 = brc_default_log();
              if (os_log_type_enabled(v114, (os_log_type_t)0x90u)) {
                -[BRCNotification initWithLocalItem:itemDiffs:]();
              }
            }
          }
          if (([v7 sharingOptions] & 0x20) != 0)
          {
            if (![v7 isKnownByServer]) {
              goto LABEL_85;
            }
            int v115 = 6144;
            v53 = v331;
          }
          else
          {
            int v115 = 0x2000;
          }
          uint64_t v120 = *v53;
          unint64_t v121 = v120 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v53 + 4) << 32);
          unsigned int *v53 = v120 & 0xFFFFC7FF | v115;
          *((unsigned char *)v53 + 4) = BYTE4(v121);
          v122 = [v7 ownerKey];
          v123 = [v7 db];
          v124 = +[BRCAccountSessionFPFS nameComponentsForKey:v122 db:v123];

          [(BRCNotification *)v332 setAttribute:v124 forKey:*MEMORY[0x263F327A8]];
LABEL_85:
          int v119 = [v7 isDocument];
          if ([v7 isSharedToMeTopLevelItem])
          {
            if (*location) {
              v125 = (void *)[*location mutableCopy];
            }
            else {
              v125 = objc_opt_new();
            }
            v130 = v125;
            id v131 = v125;

            v132 = [v7 bookmarkData];
            v133 = [v132 dataUsingEncoding:4];
            [v131 setObject:v133 forKeyedSubscript:@"com.apple.clouddocs.private.share-bookmark#B"];

            objc_storeStrong(location, v130);
            int v126 = 1;
            a4 = v328;
            v25 = v330;
            goto LABEL_97;
          }
LABEL_88:
          int v126 = 1;
LABEL_97:
          if ([v7 isShared] && (objc_msgSend(v7, "sharingOptions") & 4) != 0)
          {
            v140 = [v7 collaborationIdentifierIfComputable];
            int v139 = 1;
          }
          else
          {
            int v139 = 0;
            v140 = 0;
          }
          objc_storeStrong((id *)((char *)&v332->super.super.isa + (int)*MEMORY[0x263F32688]), v140);
          if (v139) {

          }
          if (v126)
          {
            char v141 = [v7 sharingOptions];
            uint64_t v142 = *v331;
            *((unsigned char *)v331 + 4) = (v142 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32)) >> 32;
            unsigned int *v331 = (v142 & 0xFFDFFFFF | ((v141 & 4) << 19)) ^ 0x200000;
          }
          v8 = v332;
          if (v119)
          {
            v143 = [v7 asDocument];
            v144 = [v143 currentVersion];
            v145 = [v144 lastEditorRowID];

            int v146 = objc_msgSend(v145, "br_isEqualToNumber:", &unk_26F3DD088);
            v147 = (uint64_t *)MEMORY[0x263F327A0];
            if (v146)
            {
              v8 = v332;
              [(BRCNotification *)v332 setAttribute:0 forKey:*MEMORY[0x263F327A0]];
            }
            else
            {
              v148 = [v143 currentVersion];
              v149 = [v148 lastEditorRowID];
              v150 = [v143 db];
              v151 = +[BRCAccountSessionFPFS nameComponentsForKey:v149 db:v150];

              a4 = v328;
              v25 = v330;
              uint64_t v152 = *v147;
              v8 = v332;
              [(BRCNotification *)v332 setAttribute:v151 forKey:v152];
            }
          }
          if ([v7 isInTrashScope])
          {
            v153 = [v7 st];
            v154 = [v153 logicalName];
            if ([v154 length])
            {
              v155 = [v7 st];
              v156 = [v155 logicalName];
              int v157 = [v156 characterAtIndex:0] == 46;
              unint64_t v158 = *v331 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32);
              unsigned int *v331 = *v331 & 0xFBFFFFFF | (v157 << 26);
              *((unsigned char *)v331 + 4) = BYTE4(v158);

              v25 = v330;
              v159 = v331;
            }
            else
            {
              v159 = v331;
              uint64_t v167 = *v331;
              unint64_t v168 = v167 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32);
              unsigned int *v331 = v167 & 0xFBFFFFFF;
              *((unsigned char *)v331 + 4) = BYTE4(v168);
            }

LABEL_123:
            if ([v7 isDocument])
            {
              v169 = [v7 asDocument];
              v170 = [v169 currentVersion];
              v171 = [v7 st];
              int v172 = [v171 isHiddenExt];
              int v173 = 0x4000;
              if (!v172) {
                int v173 = 0;
              }
              unint64_t v174 = *v159 & 0xFFFFBFFF | ((unint64_t)*((unsigned __int8 *)v159 + 4) << 32);
              unsigned int *v159 = *v159 & 0xFFFFBFFF | v173;
              *((unsigned char *)v159 + 4) = BYTE4(v174);

              if (v170)
              {
                v175 = [v170 editedSinceShared];
                int v176 = [v175 BOOLValue];
                int v177 = 0x1000000;
                if (!v176) {
                  int v177 = 0;
                }
                unint64_t v178 = *v159 & 0xFEFFFFFF | ((unint64_t)*((unsigned __int8 *)v159 + 4) << 32);
                unsigned int *v159 = *v159 & 0xFEFFFFFF | v177;
                *((unsigned char *)v159 + 4) = BYTE4(v178);

                uint64_t v179 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v170, "size"));
                uint64_t v180 = (int)*MEMORY[0x263F32728];
                v181 = *(Class *)((char *)&v8->super.super.isa + v180);
                *(Class *)((char *)&v8->super.super.isa + v180) = (Class)v179;

                uint64_t v182 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v170, "mtime"));
                uint64_t v183 = (int)*MEMORY[0x263F326F0];
                v184 = *(Class *)((char *)&v8->super.super.isa + v183);
                *(Class *)((char *)&v8->super.super.isa + v183) = (Class)v182;
              }
              v326 = v169;
              if ([v7 isFinderBookmark])
              {
                char v185 = 3;
              }
              else if ([v170 isPackage])
              {
                char v185 = 2;
              }
              else
              {
                char v185 = 1;
              }
              *((unsigned char *)v159 + 5) = v185;
              id v225 = objc_alloc(MEMORY[0x263EFF980]);
              v226 = [v170 conflictLoserEtags];
              id obj = (id)objc_msgSend(v225, "initWithCapacity:", objc_msgSend(v226, "count"));

              v227 = [v326 resolvedConflictLoserEtags];
              long long v335 = 0u;
              long long v336 = 0u;
              long long v337 = 0u;
              long long v338 = 0u;
              v323 = v170;
              v228 = [v170 conflictLoserEtags];
              uint64_t v229 = [v228 countByEnumeratingWithState:&v335 objects:v340 count:16];
              if (v229)
              {
                uint64_t v230 = v229;
                uint64_t v231 = *(void *)v336;
                do
                {
                  for (uint64_t i = 0; i != v230; ++i)
                  {
                    if (*(void *)v336 != v231) {
                      objc_enumerationMutation(v228);
                    }
                    uint64_t v233 = *(void *)(*((void *)&v335 + 1) + 8 * i);
                    if (([v227 containsObject:v233] & 1) == 0)
                    {
                      v234 = [[BRFieldContentSignature alloc] initWithLoserEtag:v233];
                      id v235 = objc_alloc(MEMORY[0x263F055A8]);
                      v236 = [(BRFieldContentSignature *)v234 data];
                      v237 = [MEMORY[0x263EFF8F8] data];
                      v238 = (void *)[v235 initWithContentVersion:v236 metadataVersion:v237];
                      [obj addObject:v238];
                    }
                  }
                  uint64_t v230 = [v228 countByEnumeratingWithState:&v335 objects:v340 count:16];
                }
                while (v230);
              }

              v8 = v332;
              v239 = (id *)((char *)&v332->super.super.isa + (int)*MEMORY[0x263F32690]);
              objc_storeStrong(v239, obj);
              int v240 = [*v239 count] != 0;
              v241 = v331;
              uint64_t v242 = *v331;
              unint64_t v243 = v242 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32);
              unsigned int *v331 = v242 & 0xFFFFFFBF | (v240 << 6);
              *((unsigned char *)v331 + 4) = BYTE4(v243);
              if ([v7 isDocument]
                && (*v331 & 0x40) != 0
                && [v7 isIWorkItem])
              {
                v244 = [v7 asDocument];
                v245 = [v244 currentVersion];
                v246 = [v7 db];
                uint64_t v247 = [v245 lastEditorDeviceDisplayNameWithDB:v246];
                uint64_t v248 = (int)*MEMORY[0x263F326D0];
                v249 = *(Class *)((char *)&v332->super.super.isa + v248);
                *(Class *)((char *)&v332->super.super.isa + v248) = (Class)v247;

                v241 = v331;
              }
              v250 = v326;
              a4 = v328;
              if (([v326 isDead] & 1) == 0)
              {
                v251 = [v325 fsUploader];
                int v252 = [v251 isUploadingItem:v326];
                int v253 = 256;
                if (!v252) {
                  int v253 = 0;
                }
                unint64_t v254 = *v241 & 0xFFFFFEFF | ((unint64_t)*((unsigned __int8 *)v241 + 4) << 32);
                unsigned int *v241 = *v241 & 0xFFFFFEFF | v253;
                *((unsigned char *)v241 + 4) = BYTE4(v254);

                v250 = v326;
              }
              unsigned int *v241 = *v241 & 0xFFFFFFFC | [v250 downloadStatus] & 3;
              v255 = [v250 uploadError];
              v188 = objc_msgSend(v255, "brc_wrappedError");

              v189 = v326;
              int v256 = [v326 isEvictable];
              int v257 = 0x10000000;
              if (!v256) {
                int v257 = 0;
              }
              unint64_t v258 = *v241 & 0xEFFFFFFF | ((unint64_t)*((unsigned __int8 *)v241 + 4) << 32);
              unsigned int *v241 = *v241 & 0xEFFFFFFF | v257;
              *((unsigned char *)v241 + 4) = BYTE4(v258);

              v25 = v330;
            }
            else if ([v7 isDirectory])
            {
              v186 = [v7 syncUpError];
              objc_msgSend(v186, "brc_wrappedError");
              v188 = v187 = v159;

              v189 = [v7 asDirectory];
              *((unsigned char *)v187 + 5) = 0;
              uint64_t v190 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v189, "mtime"));
              uint64_t v191 = (int)*MEMORY[0x263F326F0];
              v192 = *(Class *)((char *)&v8->super.super.isa + v191);
              *(Class *)((char *)&v8->super.super.isa + v191) = (Class)v190;

              int v193 = [v189 isSharedByMeOrContainsSharedByMeItem];
              int v194 = 0x800000;
              if (!v193) {
                int v194 = 0;
              }
              unint64_t v195 = *v187 & 0xFF7FFFFF | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32);
              unsigned int *v187 = *v187 & 0xFF7FFFFF | v194;
              *((unsigned char *)v187 + 4) = BYTE4(v195);
              int v196 = [v189 isSharedToMeOrContainsSharedToMeItem];
              int v197 = 0x400000;
              if (!v196) {
                int v197 = 0;
              }
              unint64_t v198 = *v187 & 0xFFBFFFFF | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32);
              unsigned int *v187 = *v187 & 0xFFBFFFFF | v197;
              *((unsigned char *)v187 + 4) = BYTE4(v198);
              int v199 = [v189 isAppLibraryTrashFolder];
              int v200 = 0x40000000;
              if (!v199) {
                int v200 = 0;
              }
              unint64_t v201 = *v187 & 0xBFFFFFFF | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32);
              unsigned int *v187 = *v187 & 0xBFFFFFFF | v200;
              *((unsigned char *)v187 + 4) = BYTE4(v201);
              v202 = [v7 itemID];
              int v203 = [v202 isNonDesktopRoot];
              unsigned int v204 = 0x80000000;
              if (!v203) {
                unsigned int v204 = 0;
              }
              unint64_t v205 = *v187 & 0x7FFFFFFF | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32);
              unsigned int *v187 = *v187 & 0x7FFFFFFF | v204;
              *((unsigned char *)v187 + 4) = BYTE4(v205);

              v206 = [v7 itemID];
              int v207 = [v206 isDocumentsFolder];
              uint64_t v208 = 0x100000000;
              if (!v207) {
                uint64_t v208 = 0;
              }
              unint64_t v209 = (*v187 | ((unint64_t)*((unsigned __int8 *)v187 + 4) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
              unsigned int *v187 = *v187;
              *((unsigned char *)v187 + 4) = (v209 | v208) >> 32;

              if ([v189 isDirectoryFault])
              {
                uint64_t v210 = [v189 serverQuotaUsage];
                uint64_t v211 = (int)*MEMORY[0x263F32728];
                v212 = *(Class *)((char *)&v8->super.super.isa + v211);
                *(Class *)((char *)&v8->super.super.isa + v211) = (Class)v210;
              }
              v213 = [v7 asDirectory];
              uint64_t v214 = [v213 childItemCount];
              uint64_t v215 = (int)*MEMORY[0x263F32680];
              v216 = *(Class *)((char *)&v8->super.super.isa + v215);
              *(Class *)((char *)&v8->super.super.isa + v215) = (Class)v214;

              *v331 |= 3u;
            }
            else
            {
              if (![v7 isSymLink])
              {
                v188 = 0;
LABEL_172:
                v259 = [v25 parentID];
                int v260 = [v259 isNonDesktopRoot];

                if (v260) {
                  *v331 |= 0x8000000u;
                }
                if (v188)
                {
                  v261 = objc_msgSend(v188, "br_fileProviderError");

                  [(BRCNotification *)v8 setAttribute:v261 forKey:*MEMORY[0x263F327C0]];
                }
                if ((a4 & 0x100000000) != 0)
                {
                  v262 = [v7 orig];
                  int v263 = [v262 isLost];

                  if (v263) {
                    *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x263F326A8]) |= 0x4000u;
                  }
                }
                v264 = [(BRCNotification *)v8 parentItemIdentifier];
                v265 = (void *)[v264 isEqualToString:*MEMORY[0x263F053F8]];

                uint64_t v266 = 288;
                if (v265)
                {
                  if (*location) {
                    v267 = (void *)[*location mutableCopy];
                  }
                  else {
                    v267 = objc_opt_new();
                  }
                  id obja = v267;
                  id v268 = v267;

                  v269 = [v7 serverZone];
                  v270 = [v269 dbRowID];
                  v271 = [(BRCItemGlobalID *)v8->_parentGlobalID zoneRowID];
                  char v272 = objc_msgSend(v270, "br_isEqualToNumber:", v271);

                  if ((v272 & 1) == 0)
                  {
                    v319 = brc_bread_crumbs();
                    v320 = brc_default_log();
                    if (os_log_type_enabled(v320, OS_LOG_TYPE_FAULT)) {
                      -[BRCNotification initWithLocalItem:itemDiffs:]();
                    }
                  }
                  v273 = [(BRCItemGlobalID *)v8->_parentGlobalID itemID];
                  v274 = [v273 itemIDString];
                  v275 = [v7 serverZone];
                  v276 = +[BRCLocalItem bookmarkDataWithItemResolutionString:v274 serverZone:v275];

                  v277 = [v276 dataUsingEncoding:4];
                  [v268 setObject:v277 forKeyedSubscript:@"com.apple.clouddocs.private.trash-parent-bookmark#B"];

                  v278 = [v7 clientZone];
                  v279 = [v7 st];
                  v280 = [v279 trashPutBackParentID];
                  v281 = [v7 db];
                  uint64_t v266 = [v278 itemByItemID:v280 db:v281];
                  v265 = [(id)v266 asDirectory];

                  if (v265)
                  {
                    v282 = [v265 fileObjectID];
                    uint64_t v266 = [v282 asString];
                    v283 = [(id)v266 dataUsingEncoding:4];
                    [v268 setObject:v283 forKeyedSubscript:@"com.apple.fileprovider.trash-put-back#PN"];
                  }
                  objc_storeStrong(location, obja);

                  a4 = v328;
                }
                if ([v7 isDocument])
                {
                  v284 = [BRFieldContentSignature alloc];
                  v265 = [v7 asDocument];
                  v285 = [v265 currentVersion];
                  v286 = [(BRFieldContentSignature *)v284 initWithLocalVersion:v285];

                  uint64_t v287 = [(BRFieldContentSignature *)v286 data];
                  uint64_t v288 = (int)*MEMORY[0x263F326A0];
                  v289 = *(Class *)((char *)&v8->super.super.isa + v288);
                  *(Class *)((char *)&v8->super.super.isa + v288) = (Class)v287;

                  uint64_t v290 = [(BRFieldContentSignature *)v286 equivalentVersions];
                  uint64_t v291 = (int)*MEMORY[0x263F326B0];
                  v292 = *(Class *)((char *)&v8->super.super.isa + v291);
                  *(Class *)((char *)&v8->super.super.isa + v291) = (Class)v290;
                }
                else
                {
                  uint64_t v293 = objc_opt_new();
                  uint64_t v294 = (int)*MEMORY[0x263F326A0];
                  v286 = *(BRFieldContentSignature **)((char *)&v8->super.super.isa + v294);
                  *(Class *)((char *)&v8->super.super.isa + v294) = (Class)v293;
                }

                char v295 = [v7 isZoneRoot];
                if (v295)
                {
                  v296 = 0;
                }
                else
                {
                  v297 = [BRFieldStructureSignature alloc];
                  v265 = [v7 st];
                  uint64_t v266 = [(BRFieldStructureSignature *)v297 initWithLocalStatInfo:v265];
                  v296 = [(id)v266 data];
                }
                objc_storeStrong((id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x263F32730]), v296);
                if ((v295 & 1) == 0)
                {
                }
                v298 = +[BRCQueryItemUtil sharedQueryItemUtil];
                v299 = +[BRCQueryItemInfo queryItemInfoForItem:v7];
                v300 = v325;
                uint64_t v301 = [v298 contentPolicyForItemInfo:v299 sessionContext:v325];
                *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x263F32698]) = (Class)v301;

                if ([v7 isZoneRoot]
                  && ([v7 clientZone],
                      v302 = objc_claimAutoreleasedReturnValue(),
                      char v303 = [v302 isCloudDocsZone],
                      v302,
                      (v303 & 1) == 0))
                {
                  v305 = [v325 cloudDocsClientZone];
                  v304 = v330;
                  if (v305) {
                    goto LABEL_202;
                  }
                }
                else
                {
                  v304 = v330;
                  if ([v7 isSharedToMeTopLevelItem])
                  {
                    v305 = [v7 parentClientZone];
                    if (!v305) {
                      goto LABEL_206;
                    }
LABEL_202:
                    if ([v7 isDirectory])
                    {
                      v306 = [v7 clientZone];
                      int v307 = [v306 enhancedDrivePrivacyEnabled];
                      int v308 = [v305 enhancedDrivePrivacyEnabled];

                      if (v307 != v308) {
                        *((unsigned char *)v331 + 4) = (*v331 | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32) | 0x400000000) >> 32;
                      }
                      v300 = v325;
                    }
                    goto LABEL_206;
                  }
                  v305 = 0;
                }
LABEL_206:
                if ((a4 & 0x20) != 0) {
                  *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x263F326A8]) |= 0x10u;
                }
                if ((a4 & 0x1000000040) != 0) {
                  *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x263F326A8]) |= 0x20u;
                }

                goto LABEL_211;
              }
              v217 = [v7 syncUpError];
              v188 = objc_msgSend(v217, "brc_wrappedError");

              *((unsigned char *)v331 + 5) = 4;
              *v331 |= 3u;
              v218 = [v7 asSymlink];
              uint64_t v219 = [v218 symlinkTarget];
              uint64_t v220 = (int)*MEMORY[0x263F32738];
              v221 = *(Class *)((char *)&v332->super.super.isa + v220);
              *(Class *)((char *)&v332->super.super.isa + v220) = (Class)v219;

              objc_storeStrong((id *)((char *)&v332->super.super.isa + (int)*MEMORY[0x263F326F0]), *(id *)((char *)&v332->super.super.isa + v81));
              v222 = *(Class *)((char *)&v332->super.super.isa + v220);
              v8 = v332;
              uint64_t v223 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v222, "lengthOfBytesUsingEncoding:", 4));
              uint64_t v224 = (int)*MEMORY[0x263F32728];
              v189 = *(Class *)((char *)&v332->super.super.isa + v224);
              *(Class *)((char *)&v332->super.super.isa + v224) = (Class)v223;
            }

            goto LABEL_172;
          }
          v160 = [v7 appLibrary];
          v159 = v331;
          if ([v160 isDocumentScopePublic])
          {
            char v161 = [v7 isInDataScope];

            if ((v161 & 1) == 0)
            {
              int v162 = [v7 isUserVisible];
              int v163 = 0x4000000;
              if (v162) {
                int v163 = 0;
              }
              unint64_t v164 = *v331 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32);
              unsigned int *v331 = *v331 & 0xFBFFFFFF | v163;
              unint64_t v165 = HIDWORD(v164);
              goto LABEL_120;
            }
          }
          else
          {
          }
          unint64_t v166 = *v331 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v331 + 4) << 32) | 0x200000000;
          *v331 &= ~0x4000000u;
          unint64_t v165 = HIDWORD(v166);
LABEL_120:
          *((unsigned char *)v331 + 4) = v165;
          goto LABEL_123;
        }
      }
      else
      {

        v42 = v332;
        v43 = v329;
      }
      uint64_t v45 = [(BRCAppLibrary *)v38 appLibraryID];
      p_isa = v42->_oldAppLibraryID;
      v42->_oldAppLibraryID = (NSString *)v45;
    }

    goto LABEL_22;
  }
LABEL_211:
  v309 = v8;

  return v309;
}

- (id)initRootContainerNotificationWithSessionContext:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCNotification;
  uint64_t v5 = [(BRCNotification *)&v17 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = (int)*MEMORY[0x263F326E8];
    v8 = *(Class *)((char *)&v5->super.super.isa + v7);
    *(Class *)((char *)&v5->super.super.isa + v7) = (Class)@".rootContainerItemNotification";

    uint64_t v9 = [MEMORY[0x263F325B8] fileObjectIDWithString:*MEMORY[0x263F053F0]];
    uint64_t v10 = (int)*MEMORY[0x263F326C0];
    char v11 = *(Class *)((char *)&v6->super.super.isa + v10);
    *(Class *)((char *)&v6->super.super.isa + v10) = (Class)v9;

    uint64_t v12 = (int)*MEMORY[0x263F326F8];
    v13 = *(Class *)((char *)&v6->super.super.isa + v12);
    *(Class *)((char *)&v6->super.super.isa + v12) = 0;

    uint64_t v14 = +[BRCQueryItemUtil sharedQueryItemUtil];
    uint64_t v15 = [v14 contentPolicyForRootContainerWithSessionContext:v4];
    *(Class *)((char *)&v6->super.super.isa + (int)*MEMORY[0x263F32698]) = (Class)v15;
  }
  return v6;
}

- (void)markAsLoserVersionWithEtag:(id)a3 modificationDate:(id)a4 editorNameComponents:(id)a5 lastEditorDeviceName:(id)a6 size:(id)a7
{
  id v26 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = (int)*MEMORY[0x263F32690];
  v16 = *(Class *)((char *)&self->super.super.isa + v15);
  *(Class *)((char *)&self->super.super.isa + v15) = 0;
  id v17 = a3;

  v18 = [[BRFieldContentSignature alloc] initWithLoserEtag:v17];
  uint64_t v19 = [(BRFieldContentSignature *)v18 data];
  uint64_t v20 = (int)*MEMORY[0x263F326A0];
  v21 = *(Class *)((char *)&self->super.super.isa + v20);
  *(Class *)((char *)&self->super.super.isa + v20) = v19;

  if (v26)
  {
    id v22 = NSNumber;
    [v26 timeIntervalSince1970];
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = (int)*MEMORY[0x263F326F0];
    v25 = *(Class *)((char *)&self->super.super.isa + v24);
    *(Class *)((char *)&self->super.super.isa + v24) = v23;
  }
  if (v12) {
    [(BRCNotification *)self setAttribute:v12 forKey:*MEMORY[0x263F083D8]];
  }
  objc_storeStrong((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F326D0]), a6);
  if (v14) {
    objc_storeStrong((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F32728]), a7);
  }
}

+ (id)notificationGatheredFromItem:(id)a3
{
  id result = (id)[a1 notificationFromItem:a3];
  if (result) {
    *(_WORD *)((char *)result + (int)*MEMORY[0x263F326A8]) |= 0x8000u;
  }
  return result;
}

+ (id)notificationFromItem:(id)a3
{
  id v3 = a3;
  if ([v3 isBRAlias])
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[BRCNotification notificationFromItem:]();
    }

    v6 = 0;
  }
  else
  {
    v6 = [[BRCNotification alloc] initWithLocalItem:v3 itemDiffs:0];
  }

  return v6;
}

- (void)setNumberAttribute:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 longLongValue]) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  [(BRCNotification *)self setAttribute:v7 forKey:v6];
}

- (id)notificationByStrippingSharingInfoIfNeeded
{
  uint64_t v3 = (int)*MEMORY[0x263F32670];
  uint64_t v4 = *MEMORY[0x263F327A8];
  uint64_t v5 = [*(id *)((char *)&self->super.super.isa + v3) objectForKey:*MEMORY[0x263F327A8]];

  uint64_t v6 = *MEMORY[0x263F327A0];
  uint64_t v7 = [*(id *)((char *)&self->super.super.isa + v3) objectForKey:*MEMORY[0x263F327A0]];

  if (v7 | v5)
  {
    id v8 = (char *)[(BRCNotification *)self copy];
    [*(id *)&v8[v3] removeObjectForKey:v4];
    [*(id *)&v8[v3] removeObjectForKey:v6];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (BOOL)canMerge:(id)a3
{
  uint64_t v4 = a3;
  if ([(BRCItemGlobalID *)self->_itemGlobalID isEqualToItemGlobalID:v4[40]]) {
    char v5 = [*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F326C0]) isEqualToFileObjectID:*(void *)((char *)v4 + (int)*MEMORY[0x263F326C0])];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)merge:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCNotification;
  [(BRCNotification *)&v10 merge:v4];
  if ([*((id *)v4 + 41) count])
  {
    NSUInteger v5 = [(NSSet *)self->_parentGlobalIDs count];
    uint64_t v6 = (void *)*((void *)v4 + 41);
    if (v5)
    {
      uint64_t v7 = (NSSet *)[v6 mutableCopy];
      [(NSSet *)v7 unionSet:self->_parentGlobalIDs];
    }
    else
    {
      uint64_t v7 = v6;
    }
    parentGlobalIDs = self->_parentGlobalIDs;
    self->_parentGlobalIDs = v7;
  }
  uint64_t v9 = (void *)*((void *)v4 + 42);
  if (v9) {
    objc_storeStrong((id *)&self->_oldAppLibraryID, v9);
  }
}

- (void)generateLogicalExtension:(id)a3 physicalExtension:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCNotification generateLogicalExtension:physicalExtension:]", 841, v27);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_notifications_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v29 = v27[0];
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    v33 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx generating sandbox extensions for %@%@", buf, 0x20u);
  }

  objc_super v10 = self;
  objc_sync_enter(v10);
  id v11 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x263F32700]);
  id v12 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x263F32718]);
  id v13 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x263F326E8]);
  id v14 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x263F326C0]);
  __int16 v15 = *(_WORD *)((char *)&v10->super.super.isa + (int)*MEMORY[0x263F326A8]);
  objc_sync_exit(v10);

  char v16 = [(BRCNotification *)v10 isDead];
  if (v11) {
    char v17 = v16;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0 && (v15 & 0xC030) != 0)
  {
    v18 = [NSURL fileURLWithPath:v11];
    if (v12 && (objc_msgSend(v12, "br_isSideFaultName") & 1) == 0)
    {
      v21 = [v18 URLByAppendingPathComponent:v12];
      id v22 = _issueReadWriteSandboxExtensionForURL(v21);
      if (v22) {
        [v6 setObject:v22 forKeyedSubscript:v14];
      }
      goto LABEL_23;
    }
    if (v13)
    {
      uint64_t v19 = [v18 URLByAppendingPathComponent:v13];
      uint64_t v20 = _issueReadWriteSandboxExtensionForURL(v19);
      if (v20) {
        [v6 setObject:v20 forKeyedSubscript:v14];
      }
      if (v12)
      {
LABEL_14:
        if ((objc_msgSend(v12, "br_isSideFaultName") & 1) == 0)
        {
          id v26 = brc_bread_crumbs();
          v25 = brc_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
            -[BRCNotification generateLogicalExtension:physicalExtension:]();
          }
        }
        v21 = objc_msgSend(v18, "URLByAppendingPathComponent:", v12, v26);

        id v22 = _issueReadWriteSandboxExtensionForURL(v21);

        if (v22) {
          [v7 setObject:v22 forKeyedSubscript:v14];
        }
        goto LABEL_23;
      }
    }
    else
    {
      v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCNotification generateLogicalExtension:physicalExtension:]();
      }

      uint64_t v19 = 0;
      uint64_t v20 = 0;
      if (v12) {
        goto LABEL_14;
      }
    }
    v21 = v19;
    id v22 = v20;
LABEL_23:
  }
  __brc_leave_section(v27);
}

- (BOOL)isDocumentsFolder
{
  id v2 = [(BRCNotification *)self itemGlobalID];
  uint64_t v3 = [v2 itemID];
  char v4 = [v3 isDocumentsFolder];

  return v4;
}

- (BRCItemGlobalID)itemGlobalID
{
  return self->_itemGlobalID;
}

- (BRCItemGlobalID)parentGlobalID
{
  return self->_parentGlobalID;
}

- (BRFileObjectID)oldParentFileObjectID
{
  return self->_oldParentFileObjectID;
}

- (NSSet)parentGlobalIDs
{
  return self->_parentGlobalIDs;
}

- (void)setParentGlobalIDs:(id)a3
{
}

- (BRCAppLibrary)appLibrary
{
  return self->_appLibrary;
}

- (NSString)oldAppLibraryID
{
  return self->_oldAppLibraryID;
}

- (NSString)aliasSourceAppLibraryID
{
  return self->_aliasSourceAppLibraryID;
}

- (BOOL)isInDocumentScope
{
  return self->_isInDocumentScope;
}

- (BOOL)isInDataScope
{
  return self->_isInDataScope;
}

- (BOOL)isInTrashScope
{
  return self->_isInTrashScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldAppLibraryID, 0);
  objc_storeStrong((id *)&self->_parentGlobalIDs, 0);
  objc_storeStrong((id *)&self->_itemGlobalID, 0);
  objc_storeStrong((id *)&self->_aliasSourceAppLibraryID, 0);
  objc_storeStrong((id *)&self->_oldParentFileObjectID, 0);
  objc_storeStrong((id *)&self->_parentGlobalID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
}

- (void)initWithLocalItem:itemDiffs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [item.serverZone.dbRowID br_isEqualToNumber:_parentGlobalID.zoneRowID]%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] item has both or neither a public and private share %@%@", v1, 0x16u);
}

- (void)initWithLocalItem:itemDiffs:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: finderTags.tagsCount > 0%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _fileObjectID.type != BRFileObjectIDTypeDocument%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: shareRoot%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _logicalName != nil%@", v2, v3, v4, v5, v6);
}

- (void)initWithLocalItem:itemDiffs:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !item.isBRAlias%@", v2, v3, v4, v5, v6);
}

+ (void)notificationFromItem:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't create notification from alias%@", v2, v3, v4, v5, v6);
}

- (void)generateLogicalExtension:physicalExtension:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: physicalName.br_isSideFaultName%@", v2, v3, v4, v5, v6);
}

- (void)generateLogicalExtension:physicalExtension:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: logicalName%@", v2, v3, v4, v5, v6);
}

@end