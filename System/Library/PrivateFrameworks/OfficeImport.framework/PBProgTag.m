@interface PBProgTag
+ (const)textFormatInfoForProgTagName:(const unsigned __int16 *)a3;
+ (id)binaryTagDataWithName:(const unsigned __int16 *)a3 inProgTags:(id)a4;
+ (id)binaryTagDataWithName:(const unsigned __int16 *)a3 inProgTagsParent:(id)a4;
+ (id)ensureBinaryTagDataWithName:(const unsigned __int16 *)a3 inProgTags:(id)a4;
+ (id)ensureBinaryTagDataWithName:(const unsigned __int16 *)a3 inProgTagsParent:(id)a4;
+ (id)readBulletStyleFromClientData:(id)a3;
+ (id)readMacCharStyleFromClientData:(id)a3;
+ (void)readBulletImagesFromContainerParent:(id)a3 state:(id)a4;
+ (void)readBulletImagesFromDocumentList:(id)a3 state:(id)a4;
+ (void)readBulletStylesFromDocumentList:(id)a3 state:(id)a4;
+ (void)readBulletStylesFromMainMaster:(id)a3 state:(id)a4;
+ (void)readClientData:(id)a3 state:(id)a4;
+ (void)readDocumentList:(id)a3 state:(id)a4;
+ (void)readHyperlinkScreenTipsFromDocumentList:(id)a3 state:(id)a4;
+ (void)readMacCharStylesFromDocumentList:(id)a3 state:(id)a4;
@end

@implementation PBProgTag

+ (void)readDocumentList:(id)a3 state:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [a1 readBulletStylesFromDocumentList:v7 state:v6];
  [a1 readBulletImagesFromDocumentList:v7 state:v6];
  [a1 readMacCharStylesFromDocumentList:v7 state:v6];
  [a1 readHyperlinkScreenTipsFromDocumentList:v7 state:v6];
}

+ (void)readBulletStylesFromDocumentList:(id)a3 state:(id)a4
{
  id v10 = a4;
  id v6 = [a1 binaryTagDataWithName:L"___PPT9" inProgTagsParent:a3];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 firstChildOfType:4014];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [[PBOutlineBulletDictionary alloc] initFromContainer:v8 objectType:4012];
        [v10 setPlaceholderBulletStyles:v9];
      }
    }
  }
}

+ (id)binaryTagDataWithName:(const unsigned __int16 *)a3 inProgTagsParent:(id)a4
{
  id v6 = [a4 firstChildOfType:5000];
  if (v6)
  {
    id v7 = [a1 binaryTagDataWithName:a3 inProgTags:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)binaryTagDataWithName:(const unsigned __int16 *)a3 inProgTags:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 childCount];
  if (v6)
  {
    for (uint64_t i = 0; v6 != i; ++i)
    {
      objc_opt_class();
      v8 = [v5 childAt:i];
      uint64_t v9 = [v8 eshObject];
      if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 16))(v9) == 5002)
      {
        id v10 = [v8 firstChildOfType:4026];
        v11 = v10;
        if (v10)
        {
          v12 = (void *)[v10 eshObject];
          if (v12) {
          if (CsString::operator==((uint64_t)v12 + 48, (unsigned __int16 *)a3))
          }
          {
            v15 = [v8 firstChildOfType:5003];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v13 = v15;
            }
            else {
              id v13 = 0;
            }

            goto LABEL_11;
          }
        }
      }
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

+ (void)readBulletImagesFromDocumentList:(id)a3 state:(id)a4
{
  id v7 = a4;
  uint64_t v6 = [a1 binaryTagDataWithName:L"___PPT9" inProgTagsParent:a3];
  if (v6) {
    [a1 readBulletImagesFromContainerParent:v6 state:v7];
  }
}

+ (void)readMacCharStylesFromDocumentList:(id)a3 state:(id)a4
{
  id v10 = a4;
  uint64_t v6 = [a1 binaryTagDataWithName:"_" inProgTagsParent:a3];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 firstChildOfType:4123];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [[PBOutlineBulletDictionary alloc] initFromContainer:v8 objectType:4121];
        [v10 setPlaceholderMacCharStyles:v9];
      }
    }
  }
}

+ (void)readHyperlinkScreenTipsFromDocumentList:(id)a3 state:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = [a1 binaryTagDataWithName:L"___PPT9" inProgTagsParent:v23];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 childCount];
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        v11 = [v8 childAt:i];
        uint64_t v12 = [v11 eshObject];
        if ((*(unsigned int (**)(uint64_t))(*(void *)v12 + 16))(v12) == 4068)
        {
          id v13 = [v11 firstChildOfType:4051];
          v14 = (const void *)[v13 eshObject];

          if (v14)
          {
            if (v15)
            {
              uint64_t v16 = v15[12];
              v17 = [v11 firstChildOfType:4026];
              v18 = (const void *)[v17 eshObject];

              if (v18)
              {
                if (v19)
                {
                  v20 = v19;
                  if (v19[16])
                  {
                    v21 = [v6 hyperlinkInfoWithId:v16 createIfAbsent:1];
                    v22 = (void *)[[NSString alloc] initWithCsString:v20 + 12];
                    [v21 setScreenTip:v22];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

+ (void)readBulletStylesFromMainMaster:(id)a3 state:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [a1 binaryTagDataWithName:L"___PPT9" inProgTagsParent:v16];
  uint64_t v8 = [v7 childCount];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      id v10 = [v7 childAt:i];
      uint64_t v11 = [v10 eshObject];
      if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) == 4013)
      {
        uint64_t v12 = (const void *)[v10 eshObject];
        if (v12)
        {
          if (v13)
          {
            v14 = v13;
            unsigned int Instance = EshRecord::getInstance(v13);
            if (Instance <= 8) {
              *(void *)([v6 currentSourceMasterStyleInfoOfType:(unsigned __int16)Instance] + 8) = v14;
            }
          }
        }
      }
    }
  }
}

+ (void)readClientData:(id)a3 state:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 readBulletStyleFromClientData:v9];
  uint64_t v8 = [a1 readMacCharStyleFromClientData:v9];
  [v6 setCurrentBulletStyle:v7 macCharStyle:v8];
}

+ (id)readBulletStyleFromClientData:(id)a3
{
  v3 = [a1 binaryTagDataWithName:L"___PPT9" inProgTagsParent:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 firstChildOfType:4012];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)readMacCharStyleFromClientData:(id)a3
{
  v3 = [a1 binaryTagDataWithName:"_" inProgTagsParent:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 firstChildOfType:4121];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)readBulletImagesFromContainerParent:(id)a3 state:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  id v6 = [v13 firstChildOfType:2040];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 childCount];
      if (v7)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          id v9 = [v6 childAt:i];
          uint64_t v10 = [v9 eshObject];
          if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 16))(v10) == 2041) {
            uint64_t v11 = {;
          }
            uint64_t v12 = [v5 tgtPresentation];
            [v12 addBulletBlip:v11];
          }
        }
      }
    }
  }
}

+ (const)textFormatInfoForProgTagName:(const unsigned __int16 *)a3
{
  uint64_t v4 = 0;
  while (_ChWcscmp(a3, (const unsigned __int16 *)(&+[PBProgTag textFormatInfoForProgTagName:]::infoArray)[v4]))
  {
    v4 += 2;
    if (v4 == 8) {
      return 0;
    }
  }
  return (const PBTextFormatProgTagInfo *)&(&+[PBProgTag textFormatInfoForProgTagName:]::infoArray)[v4];
}

+ (id)ensureBinaryTagDataWithName:(const unsigned __int16 *)a3 inProgTagsParent:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 firstChildOfType:5000];
  if (!v7)
  {
    uint64_t v7 = [v6 addPptContainerChildOfType:5000];
  }
  uint64_t v8 = [a1 ensureBinaryTagDataWithName:a3 inProgTags:v7];

  return v8;
}

+ (id)ensureBinaryTagDataWithName:(const unsigned __int16 *)a3 inProgTags:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 binaryTagDataWithName:a3 inProgTags:v6];
  if (!v7)
  {
    uint64_t v8 = [v6 addPptContainerChildOfType:5002];
    id v9 = (CsString *)operator new(0x48uLL);
    PptCString::PptCString((PptCString *)v9);
    id v10 = (id)[v8 addEshChild:v9];
    EshRecord::setInstance((uint64_t)v9, 0);
    CsString::append(v9 + 2, a3);
    uint64_t v7 = [v8 addPptContainerChildOfType:5003];
  }
  return v7;
}

@end