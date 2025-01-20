@interface PLCloudStreamShareJob
+ (void)publishMediaFromSources:(id)a3 toNewSharedAlbumWithName:(id)a4 withCommentText:(id)a5 recipients:(id)a6;
+ (void)publishMediaFromSources:(id)a3 toSharedAlbum:(id)a4 withCommentText:(id)a5 completionHandler:(id)a6;
- (BOOL)shouldArchiveXPCToDisk;
- (NSArray)mediaSources;
- (NSArray)recipientsInfo;
- (NSString)albumCloudGUID;
- (NSString)albumName;
- (NSString)commentText;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (void)addInfosForRecipients:(id)a3;
- (void)encodeToXPCObject:(id)a3;
- (void)executeDaemonOperation;
- (void)runDaemonSide;
- (void)setAlbumCloudGUID:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setCommentText:(id)a3;
- (void)setMediaSources:(id)a3;
- (void)setRecipientsInfo:(id)a3;
@end

@implementation PLCloudStreamShareJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientsInfo, 0);
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumCloudGUID, 0);
  objc_storeStrong((id *)&self->_mediaSources, 0);
}

- (void)setRecipientsInfo:(id)a3
{
}

- (NSArray)recipientsInfo
{
  return self->_recipientsInfo;
}

- (void)setCommentText:(id)a3
{
}

- (NSString)commentText
{
  return self->_commentText;
}

- (void)setAlbumName:(id)a3
{
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumCloudGUID:(id)a3
{
}

- (NSString)albumCloudGUID
{
  return self->_albumCloudGUID;
}

- (void)setMediaSources:(id)a3
{
}

- (NSArray)mediaSources
{
  return self->_mediaSources;
}

- (void)executeDaemonOperation
{
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__67509;
  v33[4] = __Block_byref_object_dispose__67510;
  id v34 = 0;
  v3 = objc_opt_new();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__67509;
  v31[4] = __Block_byref_object_dispose__67510;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  v4 = [MEMORY[0x1E4F8BA08] UUIDString];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke;
  v20[3] = &unk_1E586DA38;
  v20[4] = self;
  v26 = v29;
  v27 = v33;
  id v8 = v5;
  id v21 = v8;
  id v22 = v6;
  id v23 = v7;
  id v9 = v4;
  id v24 = v9;
  id v25 = v3;
  v28 = v31;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_100;
  v13[3] = &unk_1E58737F8;
  v17 = v29;
  v18 = v33;
  id v10 = v22;
  id v14 = v10;
  id v11 = v25;
  id v15 = v11;
  v19 = v31;
  id v12 = v23;
  id v16 = v12;
  [v10 performTransaction:v20 completionHandler:v13 withPriority:1];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
}

void __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke(uint64_t a1)
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  v126 = +[PLPhotoSharingHelper sharingPersonID];
  if (v126)
  {
    v1 = [*(id *)(a1 + 32) albumCloudGUID];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v1 == 0;

    v2 = *(void **)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      v3 = [v2 albumName];
      uint64_t v4 = +[PLGenericAlbum insertNewCloudSharedAlbumWithTitle:v3 lastInterestingDate:*(void *)(a1 + 40) intoLibrary:*(void *)(a1 + 48)];
      uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
      v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      uint64_t v7 = MEMORY[0x1E4F1CC38];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setIsOwned:MEMORY[0x1E4F1CC38]];
      uint64_t v8 = MEMORY[0x1E4F1CC28];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setCloudPublicURLEnabled:MEMORY[0x1E4F1CC28]];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setCloudPublicURLEnabledLocal:v8];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setCloudMultipleContributorsEnabled:v7];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setCloudMultipleContributorsEnabledLocal:v7];
      long long v161 = 0u;
      long long v162 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      id obj = *(id *)(*(void *)(a1 + 32) + 112);
      uint64_t v9 = [obj countByEnumeratingWithState:&v159 objects:v168 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v160;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v160 != v10) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v159 + 1) + 8 * i);
            uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
            id v14 = [v12 objectForKeyedSubscript:@"kRecipientFirstNameKey"];
            id v15 = [v12 objectForKeyedSubscript:@"kRecipientLastNameKey"];
            id v16 = [v12 objectForKeyedSubscript:@"kRecipientdisplayNameKey"];
            v17 = [v12 objectForKeyedSubscript:@"kRecipientEmailsNameKey"];
            v18 = [v12 objectForKeyedSubscript:@"kRecipientPhonesNameKey"];
            id v19 = +[PLCloudSharedAlbumInvitationRecord insertNewInvitationRecordIntoAlbum:v13 withFirstName:v14 lastName:v15 fullName:v16 emails:v17 phones:v18 inLibrary:*(void *)(a1 + 48)];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v159 objects:v168 count:16];
        }
        while (v9);
      }

      uint64_t v20 = a1;
    }
    else
    {
      id v22 = [v2 albumCloudGUID];
      uint64_t v23 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v22 inLibrary:*(void *)(a1 + 48)];
      uint64_t v20 = a1;
      uint64_t v24 = *(void *)(*(void *)(a1 + 88) + 8);
      id v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    v26 = [*(id *)(v20 + 48) pathManager];
    uint64_t v125 = [v26 temporaryDragAndDropDirectoryCreateIfNeeded:0 error:0];

    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v124 = [*(id *)(a1 + 32) mediaSources];
    id obja = (id)[v124 countByEnumeratingWithState:&v155 objects:v167 count:16];
    if (obja)
    {
      uint64_t v127 = *(void *)v156;
      uint64_t v123 = *MEMORY[0x1E4F8CED8];
      do
      {
        v27 = 0;
        do
        {
          if (*(void *)v156 != v127) {
            objc_enumerationMutation(v124);
          }
          v28 = *(void **)(*((void *)&v155 + 1) + 8 * (void)v27);
          *(void *)buf = 0;
          v150 = buf;
          uint64_t v151 = 0x3032000000;
          v152 = __Block_byref_object_copy__67509;
          v153 = __Block_byref_object_dispose__67510;
          id v154 = 0;
          uint64_t v143 = 0;
          v144 = (id *)&v143;
          uint64_t v145 = 0x3032000000;
          v146 = __Block_byref_object_copy__67509;
          v147 = __Block_byref_object_dispose__67510;
          id v148 = 0;
          if ([v28 mediaType] == 3)
          {
            v29 = [v28 mediaURL];
            char v30 = [v29 path];
            int v31 = [v30 hasPrefix:v125];

            if (v31)
            {
              id v32 = [v28 mediaURL];
              v33 = [v32 pathExtension];

              id v34 = *(void **)(a1 + 56);
              v142[0] = MEMORY[0x1E4F143A8];
              v142[1] = 3221225472;
              v142[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_72;
              v142[3] = &unk_1E586D9E8;
              v142[4] = v28;
              v142[5] = &v143;
              v142[6] = buf;
              writeToTemporaryMediaFileWithExtension(v33, v34, v142);
            }
            else
            {
              uint64_t v44 = [v28 videoComplement];
              id v45 = v144[5];
              v144[5] = (id)v44;

              uint64_t v46 = [v144[5] imagePath];
              v47 = (void *)*((void *)v150 + 5);
              *((void *)v150 + 5) = v46;
            }
          }
          else
          {
            v35 = [v28 mediaData];

            if (v35)
            {
              uint64_t v36 = a1;
              uint64_t v37 = [v28 mediaType];
              v38 = @"mp4";
              if (v37 != 1)
              {
                uint64_t v39 = [v28 mediaType];
                v38 = &stru_1EEB2EB80;
                if (v39 == 2)
                {
                  v40 = [v28 mediaData];
                  v41 = (void *)DCIM_newPLImageWithData();

                  v42 = (void *)DCIM_newJPEGRepresentationWithPLImage();
                  [v28 setMediaData:v42];

                  v38 = @"jpg";
                  uint64_t v36 = a1;
                }
              }
              v43 = *(void **)(v36 + 56);
              v141[0] = MEMORY[0x1E4F143A8];
              v141[1] = 3221225472;
              v141[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_86;
              v141[3] = &unk_1E586DA10;
              v141[4] = v28;
              v141[5] = buf;
              writeToTemporaryMediaFileWithExtension(v38, v43, v141);
            }
            else
            {
              v48 = [v28 mediaURL];

              if (v48)
              {
                v49 = [v28 mediaURL];
                int v50 = [v49 isFileURL];

                if (v50)
                {
                  v51 = [v28 mediaURL];
                  v52 = [v51 path];
                  int v53 = [v52 hasPrefix:v125];

                  if (v53)
                  {
                    v54 = [v28 mediaURL];
                    v55 = [v54 pathExtension];

                    v56 = *(void **)(a1 + 56);
                    v140[0] = MEMORY[0x1E4F143A8];
                    v140[1] = 3221225472;
                    v140[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_2;
                    v140[3] = &unk_1E586DA10;
                    v140[4] = v28;
                    v140[5] = buf;
                    writeToTemporaryMediaFileWithExtension(v55, v56, v140);
                  }
                  else
                  {
                    v66 = [v28 mediaURL];
                    v67 = [v66 pathExtension];
                    int v68 = [v67 isEqualToString:v123];

                    if (v68)
                    {
                      id v69 = objc_alloc(MEMORY[0x1E4F8CE20]);
                      v70 = [v28 mediaURL];
                      v71 = (void *)[v69 initWithBundleAtURL:v70];

                      v72 = [v71 imagePath];
                      uint64_t v73 = [v71 videoPath];
                      v74 = (void *)v73;
                      if (v72 && v73)
                      {
                        objc_storeStrong(v144 + 5, v71);
                        objc_storeStrong((id *)v150 + 5, v72);
                      }
                    }
                    else
                    {
                      v81 = [v28 mediaURL];
                      uint64_t v82 = [v81 path];
                      v83 = (void *)*((void *)v150 + 5);
                      *((void *)v150 + 5) = v82;
                    }
                  }
                }
                else
                {
                  v57 = [v28 mediaURL];
                  v58 = [v57 scheme];
                  int v59 = [v58 isEqualToString:@"assets-library"];

                  if (v59)
                  {
                    v60 = *(void **)(a1 + 48);
                    v61 = [v28 mediaURL];
                    v62 = [v60 photoFromAssetURL:v61];

                    if (!v62)
                    {
                      v105 = PLPhotoSharingGetLog();
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v120 = *(void *)(a1 + 32);
                        v121 = [v28 mediaURL];
                        *(_DWORD *)v163 = 138412546;
                        uint64_t v164 = v120;
                        __int16 v165 = 2112;
                        id v166 = v121;
                        _os_log_impl(&dword_19B3C7000, v105, OS_LOG_TYPE_ERROR, "%@ couldn't load asset from asset url: %@", v163, 0x16u);
                      }
                      goto LABEL_52;
                    }
                    v63 = [v62 mainFileURL];
                    uint64_t v64 = [v63 path];
                    v65 = (void *)*((void *)v150 + 5);
                    *((void *)v150 + 5) = v64;
                  }
                  else
                  {
                    v75 = (void *)MEMORY[0x1E4F1C9B8];
                    v76 = [v28 mediaURL];
                    v77 = [v75 dataWithContentsOfURL:v76];

                    if (v77)
                    {
                      v78 = [v28 mediaURL];
                      v79 = [v78 pathExtension];

                      v80 = *(void **)(a1 + 56);
                      v137[0] = MEMORY[0x1E4F143A8];
                      v137[1] = 3221225472;
                      v137[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_91;
                      v137[3] = &unk_1E586DA10;
                      v139 = buf;
                      id v138 = v77;
                      writeToTemporaryMediaFileWithExtension(v79, v80, v137);
                    }
                  }
                }
              }
            }
          }
          if (!*((void *)v150 + 5))
          {
            v105 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              uint64_t v106 = *(void *)(a1 + 32);
              *(_DWORD *)v163 = 138412546;
              uint64_t v164 = v106;
              __int16 v165 = 2112;
              id v166 = v28;
              _os_log_impl(&dword_19B3C7000, v105, OS_LOG_TYPE_ERROR, "%@ unable to find media file path for source: %@", v163, 0x16u);
            }
LABEL_52:

            goto LABEL_69;
          }
          uint64_t v136 = 0;
          v84 = [MEMORY[0x1E4F29128] UUID];
          v85 = [v84 UUIDString];

          v86 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) cloudGUID];
          v87 = [*(id *)(a1 + 48) pathManager];
          v88 = [*((id *)v150 + 5) pathExtension];
          v89 = +[PLCloudSharedAssetSaveJob nextDCIMSaveFileURLForCloudPersonID:v126 cloudAlbumGUID:v86 pathManager:v87 fileExtension:v88 assetUUID:v85];

          v90 = (void *)MEMORY[0x1E4F8B908];
          v91 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*((void *)v150 + 5) isDirectory:0];
          id v135 = 0;
          LOBYTE(v90) = [v90 copyItemAtURL:v91 toURL:v89 error:&v135];
          id v92 = v135;

          if ((v90 & 1) == 0)
          {
            v97 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            {
              uint64_t v107 = *(void *)(a1 + 32);
              *(_DWORD *)v163 = 138412546;
              uint64_t v164 = v107;
              __int16 v165 = 2112;
              id v166 = v92;
              _os_log_impl(&dword_19B3C7000, v97, OS_LOG_TYPE_ERROR, "%@ Failed to copy media for asset %@", v163, 0x16u);
            }
            id v96 = 0;
            v95 = 0;
            goto LABEL_68;
          }
          uint64_t v93 = *(void *)(a1 + 48);
          uint64_t v94 = [MEMORY[0x1E4F8BA10] savedAssetTypeForCloudSharedAsset];
          id v134 = 0;
          v95 = +[PLManagedAsset insertAssetIntoPhotoLibrary:v93 mainFileURL:v89 savedAssetType:v94 bundleScope:2 uuid:v85 replacementUUID:0 imageSource:&v136 imageData:&v134];
          id v96 = v134;
          [v95 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:v136 imageData:v96 forceSRGBConversion:0];
          v97 = [MEMORY[0x1E4F8BA08] UUIDString];
          [v95 setCloudAssetGUID:v97];
          [v95 setCloudBatchID:*(void *)(a1 + 64)];
          [v95 setCloudBatchPublishDate:*(void *)(a1 + 40)];
          [v95 setCloudPlaceholderKind:5];
          [v95 setCloudIsMyAsset:1];
          [v95 setCloudIsDeletable:1];
          id v98 = v144[5];
          if (v98)
          {
            v99 = [v98 pairingIdentifier];
            v100 = (void *)MEMORY[0x1E4F1CB10];
            v101 = [v144[5] videoPath];
            v102 = [v100 fileURLWithPath:v101 isDirectory:0];
            id v103 = v144[5];
            if (v103)
            {
              [v103 originalVideoDuration];
              id v104 = v144[5];
              if (v104)
              {
                [v104 imageDisplayTime];
LABEL_58:
                [v95 becomePhotoIrisWithMediaGroupUUID:v99 mainFileMetadata:0 videoURL:v102 videoDuration:v133 stillDisplayTime:v132 options:0];

                goto LABEL_59;
              }
            }
            else
            {
              memset(v133, 0, sizeof(v133));
            }
            memset(v132, 0, sizeof(v132));
            goto LABEL_58;
          }
LABEL_59:
          v108 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) mutableAssets];
          [v108 addObject:v95];

          [*(id *)(a1 + 72) addObject:v95];
          v109 = [*(id *)(a1 + 32) commentText];
          if (![v109 length]) {
            goto LABEL_62;
          }
          BOOL v110 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) == 0;

          if (v110)
          {
            v111 = [*(id *)(a1 + 32) commentText];
            v112 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
            v109 = [v111 stringByTrimmingCharactersInSet:v112];

            v113 = +[PLCloudSharedComment insertNewCommentIntoAsset:v95 commentDate:0 withText:v109 isLike:0 isMyComment:1 inLibrary:*(void *)(a1 + 48)];
            [v113 setIsBatchComment:MEMORY[0x1E4F1CC38]];
            [v113 setIsCaption:MEMORY[0x1E4F1CC38]];
            uint64_t v114 = *(void *)(*(void *)(a1 + 96) + 8);
            v115 = *(void **)(v114 + 40);
            *(void *)(v114 + 40) = v113;

LABEL_62:
          }
          id v131 = 0;
          BOOL v116 = +[PLResourceInstaller installInternalResourcesForExistingAsset:v95 assumeNoExistingResources:1 referencedResourceURLs:0 error:&v131];
          id v117 = v131;
          if (!v116)
          {
            v118 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              uint64_t v119 = *(void *)(a1 + 32);
              *(_DWORD *)v163 = 138412546;
              uint64_t v164 = v119;
              __int16 v165 = 2112;
              id v166 = v117;
              _os_log_impl(&dword_19B3C7000, v118, OS_LOG_TYPE_ERROR, "%@ Failed to install resources for asset %@", v163, 0x16u);
            }
          }
LABEL_68:

LABEL_69:
          _Block_object_dispose(&v143, 8);

          _Block_object_dispose(buf, 8);
          v27 = (char *)v27 + 1;
        }
        while (obja != v27);
        uint64_t v122 = [v124 countByEnumeratingWithState:&v155 objects:v167 count:16];
        id obja = (id)v122;
      }
      while (v122);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) updateCloudLastInterestingChangeDateWithDate:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) updateCloudLastContributionDateWithDate:*(void *)(a1 + 40)];
    id v21 = v125;
  }
  else
  {
    id v21 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "ERROR: sharingPersonID is nil, ending job", buf, 2u);
    }
  }
}

void __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_100(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    +[PLPhotoSharingHelper publishCloudSharedAlbumToServer:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_2_101;
  v5[3] = &unk_1E5875A90;
  v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 64);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_3;
  v3[3] = &unk_1E5875CE0;
  id v4 = *(id *)(a1 + 48);
  [v2 performTransaction:v5 completionHandler:v3 withPriority:1];
}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_2_101(void *a1)
{
  uint64_t result = +[PLPhotoSharingHelper enqueueCloudSharedAssetsForPublishToServer:a1[4] inSharedAlbum:*(void *)(*(void *)(a1[5] + 8) + 40)];
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    return +[PLPhotoSharingHelper publishCloudSharedCommentToServer:](PLPhotoSharingHelper, "publishCloudSharedCommentToServer:");
  }
  return result;
}

void __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        long long v7 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v14 = v6;
          _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "PLCloudShareStreamJob removing temporary media file at path %@", buf, 0xCu);
        }

        uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v8 removeItemAtPath:v6 error:0];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v3);
  }
}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_72(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a2];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [*(id *)(a1 + 32) mediaURL];
  id v16 = 0;
  uint64_t v6 = [v4 moveItemAtURL:v5 toURL:v3 error:&v16];
  id v7 = v16;

  if (v6)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v3];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) imagePath];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [*(id *)(a1 + 32) mediaURL];
      *(_DWORD *)buf = 138412802;
      v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v3;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Couldn't move asset from url: %@ to url: %@ with error %@.", buf, 0x20u);
    }
  }

  return v6;
}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_86(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) mediaData];
  uint64_t v6 = [v5 writeToFile:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) options:1073741825 error:0];

  return v6;
}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [*(id *)(a1 + 32) mediaURL];
  id v13 = 0;
  uint64_t v8 = [v6 moveItemAtURL:v7 toURL:v5 error:&v13];
  id v9 = v13;

  if ((v8 & 1) == 0)
  {
    long long v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [*(id *)(a1 + 32) mediaURL];
      *(_DWORD *)buf = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      v17 = v5;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Couldn't move asset from url: %@ to url: %@ with error %@.", buf, 0x20u);
    }
  }

  return v8;
}

uint64_t __47__PLCloudStreamShareJob_executeDaemonOperation__block_invoke_91(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) writeToFile:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) options:1073741825 error:0];

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)PLCloudStreamShareJob;
  id v4 = [(PLDaemonJob *)&v13 description];
  uint64_t v5 = [(PLCloudStreamShareJob *)self commentText];
  uint64_t v6 = [(PLCloudStreamShareJob *)self mediaSources];
  uint64_t v7 = [v6 count];
  uint64_t v8 = [(PLCloudStreamShareJob *)self recipientsInfo];
  id v9 = [(PLCloudStreamShareJob *)self albumCloudGUID];
  if (v9) {
    [(PLCloudStreamShareJob *)self albumCloudGUID];
  }
  else {
  long long v10 = [(PLCloudStreamShareJob *)self albumName];
  }
  uint64_t v11 = [v3 stringWithFormat:@"%@ comment (%@), sources (%lu sources), recipients (%@), album (%@)", v4, v5, v7, v8, v10];

  return v11;
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 0;
}

- (int64_t)daemonOperation
{
  return 15;
}

- (void)runDaemonSide
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    objc_super v13 = self;
    id v4 = v11;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);
  }
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudStreamShareJob runDaemonSide]"];
  uint64_t v6 = [(id)objc_opt_class() highPriorityOperationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PLCloudStreamShareJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E5875E18;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 addOperationWithBlock:v8];
}

void __38__PLCloudStreamShareJob_runDaemonSide__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
  [*(id *)(a1 + 32) executeDaemonOperation];
  uint64_t v3 = *(void **)(a1 + 32);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  [v3 setXpcReply:v4];

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)PLCloudStreamShareJob;
  objc_msgSendSuper2(&v5, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PLCloudStreamShareJob;
  id v7 = [(PLCloudSharingJob *)&v27 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    uint64_t v8 = PLArrayFromXPCDictionary();
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * v14);
          __int16 v16 = [PLStreamShareSource alloc];
          v17 = -[PLStreamShareSource initWithDictionary:](v16, "initWithDictionary:", v15, (void)v23);
          if (v17) {
            [v9 addObject:v17];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    [v7 setMediaSources:v9];
    __int16 v18 = PLArrayFromXPCDictionary();
    [v7 setRecipientsInfo:v18];

    id v19 = PLStringFromXPCDictionary();
    [v7 setCommentText:v19];

    uint64_t v20 = PLStringFromXPCDictionary();
    [v7 setAlbumCloudGUID:v20];

    __int16 v21 = PLStringFromXPCDictionary();
    [v7 setAlbumName:v21];
  }
  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PLCloudStreamShareJob;
  id v4 = a3;
  [(PLDaemonJob *)&v11 encodeToXPCObject:v4];
  objc_super v5 = [(PLCloudStreamShareJob *)self mediaSources];
  id v6 = [v5 valueForKeyPath:@"serializedDictionary"];

  PLXPCDictionarySetArray();
  id v7 = [(PLCloudStreamShareJob *)self recipientsInfo];
  PLXPCDictionarySetArray();

  uint64_t v8 = [(PLCloudStreamShareJob *)self commentText];
  PLXPCDictionarySetString();

  id v9 = [(PLCloudStreamShareJob *)self albumCloudGUID];
  PLXPCDictionarySetString();

  id v10 = [(PLCloudStreamShareJob *)self albumName];
  PLXPCDictionarySetString();
}

- (void)addInfosForRecipients:(id)a3
{
  id v19 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        id v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v19);
        objc_super v11 = [v9 firstName];
        uint64_t v12 = [v9 lastName];
        uint64_t v13 = [v9 allEmailsArray];
        uint64_t v14 = [v9 allPhonesArray];
        if (v11) {
          [v10 setObject:v11 forKeyedSubscript:@"kRecipientFirstNameKey"];
        }
        if (v12) {
          [v10 setObject:v12 forKeyedSubscript:@"kRecipientLastNameKey"];
        }
        if (v13)
        {
          uint64_t v15 = (void *)[v13 copy];
          [v10 setObject:v15 forKeyedSubscript:@"kRecipientEmailsNameKey"];
        }
        if (v14)
        {
          __int16 v16 = (void *)[v14 copy];
          [v10 setObject:v16 forKeyedSubscript:@"kRecipientPhonesNameKey"];
        }
        [v4 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v17 = [v4 copy];
  recipientsInfo = v19->_recipientsInfo;
  v19->_recipientsInfo = (NSArray *)v17;
}

+ (void)publishMediaFromSources:(id)a3 toNewSharedAlbumWithName:(id)a4 withCommentText:(id)a5 recipients:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  objc_opt_class();
  id v13 = (id)objc_opt_new();
  [v13 setMediaSources:v12];

  [v13 setAlbumName:v11];
  [v13 setCommentText:v10];

  [v13 addInfosForRecipients:v9];
  [v13 runWithCompletionHandler:0];
}

+ (void)publishMediaFromSources:(id)a3 toSharedAlbum:(id)a4 withCommentText:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  objc_opt_class();
  id v14 = (id)objc_opt_new();
  [v14 setMediaSources:v12];

  id v13 = [v11 cloudGUID];

  [v14 setAlbumCloudGUID:v13];
  [v14 setCommentText:v10];

  [v14 runWithCompletionHandler:v9];
}

@end