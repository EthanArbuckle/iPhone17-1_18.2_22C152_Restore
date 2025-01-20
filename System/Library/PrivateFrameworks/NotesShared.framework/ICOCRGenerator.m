@interface ICOCRGenerator
+ (id)ocrStringFromImage:(CGImage *)a3 title:(id *)a4 languages:(id)a5;
+ (id)ocrStringFromImageRequestHandler:(id)a3 title:(id *)a4 languages:(id)a5 session:(id)a6;
+ (id)ocrStringFromImageURL:(id)a3 title:(id *)a4 languages:(id)a5;
@end

@implementation ICOCRGenerator

+ (id)ocrStringFromImage:(CGImage *)a3 title:(id *)a4 languages:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc_init((Class)getVNSessionClass());
  v10 = (void *)[objc_alloc((Class)getVNImageRequestHandlerClass()) initWithCGImage:a3 options:MEMORY[0x1E4F1CC08] session:v9];
  v11 = [a1 ocrStringFromImageRequestHandler:v10 title:a4 languages:v8 session:v9];

  return v11;
}

+ (id)ocrStringFromImageURL:(id)a3 title:(id *)a4 languages:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)getVNSessionClass());
  v11 = (void *)[objc_alloc((Class)getVNImageRequestHandlerClass()) initWithURL:v9 options:MEMORY[0x1E4F1CC08] session:v10];

  v12 = [a1 ocrStringFromImageRequestHandler:v11 title:a4 languages:v8 session:v10];

  return v12;
}

+ (id)ocrStringFromImageRequestHandler:(id)a3 title:(id *)a4 languages:(id)a5 session:(id)a6
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v30 = a5;
  id v27 = a6;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2050000000;
  id v8 = (void *)getVNRecognizeTextRequestClass_softClass;
  uint64_t v50 = getVNRecognizeTextRequestClass_softClass;
  if (!getVNRecognizeTextRequestClass_softClass)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __getVNRecognizeTextRequestClass_block_invoke;
    v46[3] = &unk_1E64A45A0;
    v46[4] = &v47;
    __getVNRecognizeTextRequestClass_block_invoke((uint64_t)v46);
    id v8 = (void *)v48[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v47, 8);
  id v32 = objc_alloc_init(v9);
  [v32 setRecognitionLanguages:v30];
  v53[0] = v32;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  [v29 performRequests:v10 error:0];

  v31 = [v32 results];
  if ([v31 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = v31;
    uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obj);
          }
          v37 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v13 = objc_msgSend(v37, "topCandidates:", 3, v27);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v51 count:16];
          if (v14)
          {
            char v15 = 0;
            uint64_t v16 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v39 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                [v18 confidence];
                if (v19 >= 0.5)
                {
                  [v11 appendString:@"\n"];
                  if (v15) {
                    [v11 appendString:@"\t"];
                  }
                  v20 = [v18 string];
                  [v11 appendString:v20];

                  char v15 = 1;
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v51 count:16];
            }
            while (v14);
          }
          if ([v37 isTitle])
          {
            uint64_t v21 = [v13 count];
            BOOL v22 = a4 == 0;
            if (!v21) {
              BOOL v22 = 1;
            }
            if (!v22)
            {
              v23 = [v13 firstObject];
              *a4 = [v23 string];
            }
          }
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v36);
    }

    v24 = (void *)[v11 copy];
    objc_msgSend(v24, "ic_trimmedString");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  if (![(__CFString *)v25 length])
  {

    v25 = @" ";
  }
  [v28 releaseCachedResources];

  return v25;
}

@end