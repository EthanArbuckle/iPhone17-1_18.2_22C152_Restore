@interface PBHyperlink
+ (id)readAnimationInfoContainerHolder:(id)a3 presentationState:(id)a4;
+ (void)readHyperlinksWithPresentationState:(id)a3;
@end

@implementation PBHyperlink

+ (void)readHyperlinksWithPresentationState:(id)a3
{
  id v3 = a3;
  OcSummary::OcSummary((OcSummary *)v26);
  uint64_t v4 = [v3 reader];
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v4 + 120))(v4, v26);
  uint64_t DocumentRef = PptBinaryReader::getDocumentRef((PptBinaryReader *)[v3 reader]);
  objc_opt_class();
  v6 = [v3 documentRoot];
  v7 = [v6 pbReferenceWithID:DocumentRef];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(isKindOfClass & 1);
  v9 = [v7 firstChildOfType:1033];
  v10 = v9;
  if (v9)
  {
    unint64_t v11 = [v9 childCount];
    if (v11 >= 2)
    {
      unint64_t v12 = 0;
      uint64_t v13 = 1;
      v24 = v7;
      id v25 = v3;
      do
      {
        v14 = objc_msgSend(v10, "childAt:", v13, v24, v25);
        uint64_t v15 = [v14 eshObject];
        if ((*(unsigned int (**)(uint64_t))(*(void *)v15 + 16))(v15) == 4055)
        {
          v16 = [v14 firstChildOfType:4051];
          v17 = v16;
          if (v16)
          {
            v18 = (const void *)[v16 eshObject];
            if (v18)
            {
              if (v19)
              {
                if (v12 < ((unint64_t)(v28 - v27) >> 3))
                {
                  uint64_t v20 = *(void *)(v27 + 8 * v12);
                  v21 = [v3 hyperlinkInfoWithId:v19[12] createIfAbsent:1];
                  if (*(_DWORD *)(v20 + 40))
                  {
                    v22 = (void *)[[NSString alloc] initWithCsString:v20 + 24];
                    [v21 setHyperlink1:v22];
                  }
                  if (*(_DWORD *)(v20 + 64))
                  {
                    v23 = (void *)[[NSString alloc] initWithCsString:v20 + 48];
                    [v21 setHyperlink2:v23];
                  }
                  v7 = v24;
                  id v3 = v25;
                }
                ++v12;
              }
            }
          }
        }
        ++v13;
      }
      while (v11 != v13);
    }
  }

  OcSummary::~OcSummary((OcSummary *)v26);
}

+ (id)readAnimationInfoContainerHolder:(id)a3 presentationState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 firstChildOfType:4083];
  uint64_t v8 = [v7 eshObject];

  if (!v8)
  {
    uint64_t v13 = 0;
    goto LABEL_38;
  }
  id v31 = v6;
  v9 = [v6 hyperlinkInfoWithId:*(unsigned int *)(v8 + 52) createIfAbsent:0];
  uint64_t v32 = [v9 screenTip];
  v33 = [v9 hyperlink1];
  v10 = [v9 hyperlink2];
  int v11 = *(_DWORD *)(v8 + 56);
  if (v11 == 4) {
    int v12 = *(_DWORD *)(v8 + 72);
  }
  else {
    int v12 = 255;
  }
  int v14 = *(_DWORD *)(v8 + 64);
  v30 = v10;
  uint64_t v15 = [v10 componentsSeparatedByString:@","];
  if ((unint64_t)[v15 count] < 2)
  {
    uint64_t v17 = 0;
  }
  else
  {
    v16 = [v15 objectAtIndex:1];
    uint64_t v17 = [v16 intValue];

    if ((unint64_t)[v15 count] >= 3)
    {
      v34 = [v15 objectAtIndex:2];
      goto LABEL_11;
    }
  }
  v34 = &stru_26EBF24D8;
LABEL_11:
  uint64_t v18 = 0;
  uint64_t v19 = 1;
  int v20 = v11 - 2;
  uint64_t v21 = 0;
  switch(v20)
  {
    case 0:
      if (v12) {
        goto LABEL_30;
      }
      v22 = [v5 childOfType:4026 instance:2];
      uint64_t v23 = [v22 eshObject];

      if (v23 && *(_DWORD *)(v23 + 64))
      {
        v24 = [NSString stringWithCsString:v23 + 48];
        id v25 = (void *)v32;
        uint64_t v26 = [NSURL fileURLWithPath:v24];

        uint64_t v19 = 1;
        uint64_t v27 = @"ppaction://program";
        goto LABEL_36;
      }
      uint64_t v18 = 0;
      goto LABEL_26;
    case 1:
      if ((v14 - 1) < 6)
      {
        uint64_t v19 = 0;
        uint64_t v26 = 0;
        uint64_t v27 = off_264D68688[v14 - 1];
        id v25 = (void *)v32;
        goto LABEL_36;
      }
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      goto LABEL_31;
    case 2:
      switch(v12)
      {
        case 7:
          uint64_t v18 = 0;
          uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"ppaction://hlinksldjump?slideindex=%d", v17);
          goto LABEL_23;
        case 8:
          id v25 = (void *)v32;
          if (!v33) {
            goto LABEL_30;
          }
          uint64_t v26 = objc_msgSend(NSURL, "URLWithString:");
          if (v26)
          {
            uint64_t v27 = 0;
            goto LABEL_36;
          }
          v29 = objc_msgSend(v33, "tc_escapedPath");
          uint64_t v18 = [NSURL URLWithString:v29];

          break;
        case 9:
          uint64_t v21 = [NSString stringWithFormat:@"ppaction://hlinkpres?slideindex=%d&slidetitle=%@", v17, v34];
          uint64_t v18 = [NSURL URLWithString:v33];
          goto LABEL_32;
        case 10:
          uint64_t v27 = @"ppaction://hlinkfile";
          id v25 = (void *)v32;
          uint64_t v26 = [NSURL URLWithString:v33];
          goto LABEL_36;
        default:
          goto LABEL_30;
      }
LABEL_26:
      uint64_t v21 = 0;
      uint64_t v19 = 1;
      goto LABEL_32;
    case 5:
      if (v12 == 6 && [(__CFString *)v34 length])
      {
        uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"ppaction://customshow?id=%d", 0);
        uint64_t v18 = 0;
LABEL_23:
        uint64_t v19 = 0;
      }
      else
      {
LABEL_30:
        uint64_t v18 = 0;
LABEL_31:
        uint64_t v21 = 0;
      }
LABEL_32:
      uint64_t v26 = v18;
      uint64_t v27 = (__CFString *)v21;
      id v25 = (void *)v32;
      if (v26 | v21)
      {
LABEL_36:
        uint64_t v13 = objc_alloc_init(OADHyperlink);
        [(OADHyperlink *)v13 setTargetLocation:v26];
        [(OADHyperlink *)v13 setTargetMode:v19];
        [(OADHyperlink *)v13 setTargetFrame:0];
        [(OADHyperlink *)v13 setAction:v27];
        [(OADHyperlink *)v13 setTooltip:v25];
        [(OADHyperlink *)v13 setInvalidUrl:0];
        [(OADHyperlink *)v13 setDoEndSound:*(unsigned __int8 *)(v8 + 69)];
        [(OADHyperlink *)v13 setIsVisited:*(unsigned __int8 *)(v8 + 71)];
        [(OADHyperlink *)v13 setDoAddToHistory:1];
      }
      else
      {
        uint64_t v13 = 0;
      }

      id v6 = v31;
      break;
    default:
      goto LABEL_32;
  }
LABEL_38:

  return v13;
}

@end