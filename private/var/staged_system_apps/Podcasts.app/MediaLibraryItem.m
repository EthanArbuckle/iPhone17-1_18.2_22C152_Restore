@interface MediaLibraryItem
- (NSDictionary)mediaLibraryDictionary;
@end

@implementation MediaLibraryItem

- (NSDictionary)mediaLibraryDictionary
{
  v3 = [(MediaLibraryItem *)self hasVideo];
  if ([v3 BOOLValue]) {
    uint64_t v4 = 256;
  }
  else {
    uint64_t v4 = 4;
  }

  id v73 = (id)objc_opt_new();
  v92[0] = &off_1005799F8;
  v86 = [(MediaLibraryItem *)self dateAccessed];
  v93[0] = v86;
  v92[1] = &off_100579A10;
  uint64_t v5 = [(MediaLibraryItem *)self album];
  v85 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = +[NSNull null];
  }
  v60 = (void *)v5;
  v93[1] = v5;
  v92[2] = &off_100579A28;
  uint64_t v6 = [(MediaLibraryItem *)self title];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = +[NSNull null];
  }
  v59 = (void *)v6;
  v93[2] = v6;
  v92[3] = &off_100579A40;
  v83 = [(MediaLibraryItem *)self fileSize];
  v93[3] = v83;
  v92[4] = &off_100579A58;
  uint64_t v8 = [(MediaLibraryItem *)self externalGuid];
  v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = +[NSNull null];
  }
  v58 = (void *)v8;
  v93[4] = v8;
  v92[5] = &off_100579A70;
  v81 = [(MediaLibraryItem *)self bookmarkTimeMillis];
  v93[5] = v81;
  v92[6] = &off_100579A88;
  uint64_t v10 = [(MediaLibraryItem *)self seriesName];
  v80 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = +[NSNull null];
  }
  v84 = v7;
  v57 = (void *)v10;
  v93[6] = v10;
  v92[7] = &off_100579AA0;
  v79 = [(MediaLibraryItem *)self totalTimeMillis];
  v93[7] = v79;
  v92[8] = &off_100579AB8;
  uint64_t v11 = [(MediaLibraryItem *)self itemDescription];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = +[NSNull null];
  }
  v56 = (void *)v11;
  v93[8] = v11;
  v92[9] = &off_100579AD0;
  v77 = +[NSNumber numberWithUnsignedInt:v4];
  v93[9] = v77;
  v92[10] = &off_100579AE8;
  v76 = [(MediaLibraryItem *)self hasVideo];
  v93[10] = v76;
  v92[11] = &off_100579B00;
  uint64_t v13 = [(MediaLibraryItem *)self feedUrl];
  v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = +[NSNull null];
  }
  v55 = (void *)v13;
  v93[11] = v13;
  v92[12] = &off_100579B18;
  uint64_t v15 = [(MediaLibraryItem *)self itemDescription];
  v16 = (void *)v15;
  if (!v15)
  {
    uint64_t v15 = +[NSNull null];
  }
  v54 = (void *)v15;
  v93[12] = v15;
  v92[13] = &off_100579B30;
  uint64_t v17 = [(MediaLibraryItem *)self playlistId];
  v18 = (void *)v17;
  if (!v17)
  {
    uint64_t v17 = +[NSNull null];
  }
  v53 = (void *)v17;
  v93[13] = v17;
  v92[14] = &off_100579B48;
  uint64_t v19 = [(MediaLibraryItem *)self dateReleased];
  v20 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = +[NSNull null];
  }
  v52 = (void *)v19;
  v93[14] = v19;
  v92[15] = &off_100579B60;
  uint64_t v21 = [(MediaLibraryItem *)self artist];
  v22 = (void *)v21;
  if (!v21)
  {
    uint64_t v21 = +[NSNull null];
  }
  v51 = (void *)v21;
  v93[15] = v21;
  v92[16] = &off_100579B78;
  v68 = [(MediaLibraryItem *)self totalTimeMillis];
  v93[16] = v68;
  v92[17] = &off_100579B90;
  v67 = +[NSNumber numberWithUnsignedInt:v4];
  v93[17] = v67;
  v92[18] = &off_100579BA8;
  uint64_t v23 = [(MediaLibraryItem *)self activeDsid];
  v89 = (void *)v23;
  if (!v23)
  {
    uint64_t v23 = +[NSNull null];
  }
  v50 = (void *)v23;
  v93[18] = v23;
  v92[19] = &off_100579BC0;
  v66 = [(MediaLibraryItem *)self playCount];
  v93[19] = v66;
  v92[20] = &off_100579BD8;
  uint64_t v24 = [(MediaLibraryItem *)self serpentId];
  v88 = (void *)v24;
  if (!v24)
  {
    uint64_t v24 = +[NSNull null];
  }
  v49 = (void *)v24;
  v93[20] = v24;
  v92[21] = &off_100579BF0;
  v65 = [(MediaLibraryItem *)self hasBeenPlayed];
  v93[21] = v65;
  v92[22] = &off_100579C08;
  uint64_t v25 = [(MediaLibraryItem *)self activeDsid];
  v87 = (void *)v25;
  if (!v25)
  {
    uint64_t v25 = +[NSNull null];
  }
  v78 = v12;
  v48 = (void *)v25;
  v93[22] = v25;
  v92[23] = &off_100579C20;
  v64 = [(MediaLibraryItem *)self playCount];
  v93[23] = v64;
  v92[24] = &off_100579C38;
  uint64_t v26 = [(MediaLibraryItem *)self itemFilePath];
  v63 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = +[NSNull null];
  }
  v75 = v14;
  v47 = (void *)v26;
  v93[24] = v26;
  v92[25] = &off_100579C50;
  v62 = [(MediaLibraryItem *)self statsDownloadIdentifier];
  v93[25] = v62;
  v92[26] = &off_100579C68;
  uint64_t v27 = [(MediaLibraryItem *)self dateReleased];
  v28 = (void *)v27;
  if (!v27)
  {
    uint64_t v27 = +[NSNull null];
  }
  v69 = v22;
  v70 = v20;
  v71 = v18;
  v72 = v16;
  v82 = v9;
  v46 = (void *)v27;
  v93[26] = v27;
  v92[27] = &off_100579C80;
  v61 = [(MediaLibraryItem *)self artworkTokenId];
  uint64_t v29 = [v61 stringValue];
  v30 = (void *)v29;
  if (!v29)
  {
    v44 = +[NSUUID UUID];
    uint64_t v29 = [v44 UUIDString];
  }
  v45 = (void *)v29;
  v93[27] = v29;
  v92[28] = &off_100579C98;
  v31 = +[MediaLibraryItem remeberBookmark];
  v93[28] = v31;
  v92[29] = &off_100579CB0;
  v32 = +[MediaLibraryItem playbackStart];
  v93[29] = v32;
  v92[30] = &off_100579CC8;
  v33 = +[MediaLibraryItem isOTAPurchased];
  v93[30] = v33;
  v92[31] = &off_100579CE0;
  v34 = +[MediaLibraryItem needsRestore];
  v93[31] = v34;
  v92[32] = &off_100579CF8;
  v35 = +[MediaLibraryItem chosenByAutofill];
  v93[32] = v35;
  v92[33] = &off_100579D10;
  v36 = +[MediaLibraryItem isCompilation];
  v93[33] = v36;
  v92[34] = &off_100579D28;
  v37 = +[MediaLibraryItem playbackRelativeVolume];
  v93[34] = v37;
  v93[35] = &off_100579D58;
  v92[35] = &off_100579D40;
  v92[36] = &off_100579D70;
  v93[36] = &off_100579D88;
  v93[37] = &off_100579D88;
  v92[37] = &off_100579DA0;
  v92[38] = &off_100579DB8;
  v93[38] = &off_100579D88;
  v93[39] = &off_100579D88;
  v92[39] = &off_100579DD0;
  v92[40] = &off_100579DE8;
  v93[40] = &off_100579D88;
  v93[41] = &off_100579D88;
  v92[41] = &off_100579E00;
  v92[42] = &off_100579E18;
  v93[42] = &off_100579D88;
  v93[43] = &off_100579D88;
  v92[43] = &off_100579E30;
  v92[44] = &off_100579E48;
  v93[44] = &off_100579D88;
  v93[45] = &off_100579D88;
  v92[45] = &off_100579E60;
  v92[46] = &off_100579E78;
  v93[46] = &off_100579D88;
  v93[47] = &off_100579D88;
  v92[47] = &off_100579E90;
  v92[48] = &off_100579EA8;
  v93[48] = &off_100579D88;
  v93[49] = &off_100579D88;
  v92[49] = &off_100579EC0;
  v92[50] = &off_100579ED8;
  v93[50] = &off_100579D88;
  v93[51] = &off_100579D88;
  v92[51] = &off_100579EF0;
  v92[52] = &off_100579F08;
  v93[52] = &off_100579D88;
  v93[53] = &off_100579D88;
  v92[53] = &off_100579F20;
  v92[54] = &off_100579F38;
  v93[54] = &off_100579D88;
  v93[55] = &off_100579D88;
  v92[55] = &off_100579F50;
  v92[56] = &off_100579F68;
  v93[56] = &off_100579D88;
  v93[57] = &off_100579D88;
  v92[57] = &off_100579F80;
  v92[58] = &off_100579F98;
  v93[58] = &off_100579D88;
  v93[59] = &off_100579D88;
  v92[59] = &off_100579FB0;
  v92[60] = &off_100579FC8;
  v93[60] = &off_100579D88;
  v38 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:61];
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100145F20;
  v90[3] = &unk_100552EA8;
  id v74 = v73;
  id v91 = v74;
  [v38 enumerateKeysAndObjectsUsingBlock:v90];

  if (!v30)
  {
  }
  if (!v28) {

  }
  if (!v63) {
  v39 = v87;
  }
  if (!v87)
  {

    v39 = 0;
  }

  v40 = v88;
  if (!v88)
  {

    v40 = 0;
  }

  v41 = v89;
  if (!v89)
  {

    v41 = 0;
  }

  if (!v69) {
  if (!v70)
  }

  if (!v71) {
  if (!v72)
  }

  if (!v75) {
  if (!v78)
  }

  if (!v80) {
  if (!v82)
  }

  if (!v84) {
  if (!v85)
  }

  v42 = (NSDictionary *)v74;
  return v42;
}

@end