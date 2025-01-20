@interface PBMedia
+ (BOOL)readEmbeddedSoundFromClientDataHolder:(id)a3 toImage:(id)a4 state:(id)a5;
+ (BOOL)readLinkedMovieFromMovieHolder:(id)a3 toImage:(id)a4 state:(id)a5;
@end

@implementation PBMedia

+ (BOOL)readEmbeddedSoundFromClientDataHolder:(id)a3 toImage:(id)a4 state:(id)a5
{
  id v7 = a3;
  id v40 = a4;
  id v8 = a5;
  v9 = [v7 firstChildOfType:4115];
  v10 = v9;
  if (!v9)
  {
    char v16 = 0;
    goto LABEL_28;
  }
  uint64_t DocumentRef = PptBinaryReader::getDocumentRef((PptBinaryReader *)[v8 reader]);
  v12 = [v8 documentRoot];
  v39 = v10;
  v13 = [v12 pbReferenceWithID:DocumentRef];
  id v37 = v8;
  id v38 = v7;

  v36 = v13;
  v14 = [v13 firstChildOfType:2020];
  unsigned int v15 = 0;
  char v16 = 0;
  while ([v14 childCount] > (unint64_t)v15)
  {
    v17 = [v14 childAt:v15];
    uint64_t v18 = [v17 eshObject];
    if ((*(unsigned int (**)(uint64_t))(*(void *)v18 + 16))(v18) != 2022) {
      goto LABEL_21;
    }
    v19 = [v17 childOfType:4026 instance:2];
    v20 = (const void *)[v19 eshObject];
    if (v20
    {
      v22 = [NSString stringWithCsString:v21 + 48];
    }
    else
    {
      v22 = 0;
    }
    if ([v22 intValue] != v41)
    {

LABEL_21:
      goto LABEL_22;
    }
    v23 = [v17 childOfType:4026 instance:0];
    v24 = (const void *)[v23 eshObject];
    if (v24
    {
      v42 = [NSString stringWithCsString:v25 + 48];
    }
    else
    {
      v42 = 0;
    }
    v26 = [v17 firstChildOfType:2023];
    v27 = (const void *)[v26 eshObject];
    if (v27
    {
      BinaryDataReference = PptBinaryDataAtom::getBinaryDataReference(v28);
      if (BinaryDataReference->var3)
      {
        v30 = objc_alloc_init(OADSound);
        v31 = [[ESDBlipContext alloc] initWithOffset:BinaryDataReference->var1 byteCount:BinaryDataReference->var3 stream:BinaryDataReference->var7 streamID:BinaryDataReference->var2];
        [(OCDDelayedNode *)v30 setDelayedContext:v31];
        [(OADSound *)v30 setName:v42];
        v32 = objc_alloc_init(OADOle);
        [(OADOle *)v32 setObject:v30];
        [v40 setOle:v32];

        char v33 = 0;
        int v34 = 0;
        char v16 = 1;
      }
      else
      {
        int v34 = 0;
        char v33 = 1;
      }
    }
    else
    {
      char v33 = 0;
      int v34 = 1;
    }

    if (v33) {
      goto LABEL_21;
    }

    if (!v34) {
      break;
    }
LABEL_22:
    ++v15;
  }

  id v8 = v37;
  id v7 = v38;
  v10 = v39;
LABEL_28:

  return v16 & 1;
}

+ (BOOL)readLinkedMovieFromMovieHolder:(id)a3 toImage:(id)a4 state:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 eshObject];
  (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
  v11 = [v7 childOfType:4026 instance:0];
  v12 = v11;
  if (v11)
  {
    v13 = (char *)[v11 eshObject];
    if (v13) {
    v14 = [NSString stringWithCsString:v13 + 48];
    }
    id v15 = [v8 movie];
    if (!v15)
    {
      id v15 = objc_alloc_init((Class)objc_opt_class());
      [v15 setIsExternal:1];
      [v8 setMovie:v15];
    }
    [v15 setName:v14];
  }
  return v12 != 0;
}

@end