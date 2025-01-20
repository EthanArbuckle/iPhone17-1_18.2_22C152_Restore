@interface UserPathManager
- (BOOL)buildLookupTree;
- (BOOL)computeTranslations:(id)a3;
- (UserPathManager)initWithPathFile:(id)a3;
- (id)lookup:(id)a3 keyboardController:(id)a4;
- (id)translateLayoutForKeys:(id)a3 keyboardController:(id)a4;
- (void)dealloc;
- (void)setRandomNumberSeed:(unsigned int)a3;
@end

@implementation UserPathManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translatedKBDLayouts, 0);
  objc_storeStrong((id *)&self->_lookupTree, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_pathFile, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (id)lookup:(id)a3 keyboardController:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v39 = a4;
  v6 = [(NSMutableDictionary *)self->_lookupTree objectForKey:v38];
  if (v6
    || (lookupTree = self->_lookupTree,
        [v38 lowercaseString],
        v8 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)lookupTree objectForKey:v8],
        v6 = objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    v35 = v6;
    v40 = objc_msgSend(v6, "objectAtIndex:", std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)self->m_generator)% (unint64_t)objc_msgSend(v6, "count"));
    v9 = [v39 keyplane];
    uint64_t v10 = [v9 name];

    v37 = (void *)v10;
    v11 = [(NSMutableDictionary *)self->_transforms objectForKey:v10];
    if (!v11)
    {
      [(UserPathManager *)self computeTranslations:v39];
      v11 = [(NSMutableDictionary *)self->_transforms objectForKey:v10];
    }
    v12 = [v40 layout];
    v13 = [v11 objectForKey:v12];

    v36 = v13;
    if (v13)
    {
      [v13 getValue:v46];
      v14 = objc_alloc_init(TIContinuousPathWithLayoutName);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v15 = [v40 samples];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v43 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            [v19 point];
            double v21 = v20;
            double v22 = *(double *)v46;
            double v23 = *(double *)&v46[2];
            [v19 point];
            double v25 = v24;
            double v41 = *(double *)&v46[1];
            double v26 = *(double *)&v46[3];
            v27 = [TIContinuousPathSample alloc];
            [v19 timeStamp];
            double v29 = v28;
            [v19 force];
            double v31 = v30;
            [v19 radius];
            v33 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v27, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", [v19 stage], objc_msgSend(v19, "pathIndex"), v23 + v21 * v22, v26 + v25 * v41, v29, v31, v32);
            [(TIContinuousPath *)v14 addSample:v33];
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v16);
      }
    }
    else
    {
      v14 = v40;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)buildLookupTree
{
  v2 = 0;
  uint64_t v53 = *MEMORY[0x263EF8340];
  for (uint64_t i = self; ; self = i)
  {
    double v32 = [(TTKTestCaseSource *)self->_source getNextTestCase];

    if (!v32) {
      break;
    }
    v3 = [v32 records];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v3;
    uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v28)
    {
      uint64_t v30 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(obj);
          }
          v4 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          v33 = objc_msgSend(v4, "primaryIntendedText", v28);
          v5 = [TIContinuousPathWithLayoutName alloc];
          v6 = [v4 layoutName];
          v7 = [(TIContinuousPathWithLayoutName *)v5 initWithLayout:v6];

          v8 = [v4 touchDataCollection];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v35 = v8;
          uint64_t v9 = [v35 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v9)
          {
            uint64_t v36 = *(void *)v43;
            float v10 = -1.0;
            do
            {
              uint64_t v37 = v9;
              for (uint64_t k = 0; k != v37; ++k)
              {
                if (*(void *)v43 != v36) {
                  objc_enumerationMutation(v35);
                }
                v12 = *(void **)(*((void *)&v42 + 1) + 8 * k);
                long long v38 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                v13 = [v12 samples];
                uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
                if (v14)
                {
                  uint64_t v15 = *(void *)v39;
                  do
                  {
                    for (uint64_t m = 0; m != v14; ++m)
                    {
                      if (*(void *)v39 != v15) {
                        objc_enumerationMutation(v13);
                      }
                      uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * m);
                      if (v10 < 0.0)
                      {
                        [*(id *)(*((void *)&v38 + 1) + 8 * m) timeStamp];
                        float v10 = v18;
                      }
                      v19 = [TIContinuousPathSample alloc];
                      [v17 point];
                      double v21 = v20;
                      double v23 = v22;
                      [v17 timeStamp];
                      double v25 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v19, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", [v17 stage], objc_msgSend(v17, "pathIndex"), v21, v23, v24 - v10, 0.0, 0.0);
                      [(TIContinuousPath *)v7 addSample:v25];
                    }
                    uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
                  }
                  while (v14);
                }
              }
              uint64_t v9 = [v35 countByEnumeratingWithState:&v42 objects:v51 count:16];
            }
            while (v9);
          }

          double v26 = [(NSMutableDictionary *)i->_lookupTree objectForKey:v33];
          if (!v26)
          {
            double v26 = [MEMORY[0x263EFF980] array];
            -[NSMutableDictionary setObject:forKey:](i->_lookupTree, "setObject:forKey:");
          }
          [v26 addObject:v7];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v28);
    }

    v2 = v32;
  }
  return 1;
}

- (id)translateLayoutForKeys:(id)a3 keyboardController:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v5 = a4;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x5012000000;
  v65[3] = __Block_byref_object_copy__1445;
  v65[4] = __Block_byref_object_dispose__1446;
  v65[5] = &unk_23F0564DE;
  long long v6 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v66 = *MEMORY[0x263F001A0];
  long long v67 = v6;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__15;
  v63[4] = __Block_byref_object_dispose__16;
  id v64 = 0;
  v7 = [v5 keyplane];
  v8 = [v7 keys];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __61__UserPathManager_translateLayoutForKeys_keyboardController___block_invoke;
  v62[3] = &unk_2650503D0;
  v62[4] = v63;
  v62[5] = v65;
  [v8 enumerateObjectsUsingBlock:v62];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v51;
  uint64_t v9 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v9)
  {
    uint64_t v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    uint64_t v10 = *(void *)v59;
    double v11 = 1000000000.0;
    double v12 = 1000000000.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v59 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v15 = [v14 string];
        uint64_t v16 = [v5 layoutUtils];
        uint64_t v17 = [v5 keyplane];
        double v18 = [v16 exactKeyForString:v15 keyplane:v17];

        if (v18)
        {
          [v18 frame];
          +[TITesterMathUtils distanceBetween:andPoint:](TITesterMathUtils, "distanceBetween:andPoint:");
          double v20 = v19;
          [v18 frame];
          +[TITesterMathUtils distanceBetween:andPoint:](TITesterMathUtils, "distanceBetween:andPoint:");
          double v22 = v21;
          if (v12 > v20)
          {
            id v23 = v18;

            id v24 = v14;
            double v12 = v20;
            v54 = v23;
            v56 = v24;
          }
          if (v11 > v22)
          {
            id v25 = v18;

            id v26 = v14;
            double v11 = v22;
            uint64_t v53 = v25;
            v55 = v26;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v9);

    v27 = 0;
    if (v56 && v55)
    {
      [v54 frame];
      double v50 = v28;
      [v54 frame];
      double v49 = v29;
      [v54 frame];
      [v54 frame];
      [v53 frame];
      double v31 = v30;
      [v53 frame];
      double v33 = v32;
      [v53 frame];
      [v53 frame];
      [v56 frame];
      CGFloat x = v77.origin.x;
      CGFloat y = v77.origin.y;
      CGFloat width = v77.size.width;
      CGFloat height = v77.size.height;
      double MidX = CGRectGetMidX(v77);
      v78.origin.CGFloat x = x;
      v78.origin.CGFloat y = y;
      v78.size.CGFloat width = width;
      v78.size.CGFloat height = height;
      objc_msgSend(v55, "frame", CGRectGetMidY(v78));
      CGFloat v39 = v79.origin.x;
      CGFloat v40 = v79.origin.y;
      CGFloat v41 = v79.size.width;
      CGFloat v42 = v79.size.height;
      double v43 = CGRectGetMidX(v79);
      v80.origin.CGFloat x = v39;
      v80.origin.CGFloat y = v40;
      v80.size.CGFloat width = v41;
      v80.size.CGFloat height = v42;
      CGRectGetMidY(v80);
      double v44 = v31 + v33 * 0.5;
      *(float *)&CGFloat v39 = MidX;
      v73[0] = LODWORD(v39);
      v73[1] = 1065353216;
      float v45 = v43;
      *(float *)&v73[2] = v45;
      v73[3] = 1065353216;
      *(float *)&double v31 = v50 + v49 * 0.5;
      float v46 = v44;
      float v71 = *(float *)&v31;
      float v72 = v46;
      if (+[TITesterMathUtils solveSystemOfEquations:withBMatrix:size:](TITesterMathUtils, "solveSystemOfEquations:withBMatrix:size:", v73, &v71, 2)|| (v70[0] = MidX, v70[1] = 1.0, v70[2] = v45, v70[3] = 1.0, float v68 = v50 + v49 * 0.5, v69 = v46, +[TITesterMathUtils solveSystemOfEquations:v70 withBMatrix:&v68 size:2]))
      {
        v27 = 0;
      }
      else
      {
        v57[0] = v71;
        v57[1] = v68;
        v57[2] = v72;
        v57[3] = v69;
        v27 = [MEMORY[0x263F08D40] value:v57 withObjCType:"{?=dddd}"];
      }
    }
    long long v47 = v53;
  }
  else
  {

    v55 = 0;
    v56 = 0;
    v54 = 0;
    long long v47 = 0;
    v27 = 0;
  }

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  return v27;
}

void __61__UserPathManager_translateLayoutForKeys_keyboardController___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  long long v6 = (id *)(v5 + 40);
  id v18 = v4;
  if (!v7)
  {
    objc_storeStrong(v6, a2);
    id v4 = v18;
  }
  [v4 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  if (IsNull)
  {
    *(CGFloat *)(v17 + 48) = v9;
    *(CGFloat *)(v17 + 56) = v11;
    *(CGFloat *)(v17 + 64) = v13;
    *(CGFloat *)(v17 + 72) = v15;
  }
  else
  {
    v20.origin.CGFloat x = v9;
    v20.origin.CGFloat y = v11;
    v20.size.CGFloat width = v13;
    v20.size.CGFloat height = v15;
    *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = CGRectUnion(*(CGRect *)(v17 + 48), v20);
  }
}

- (BOOL)computeTranslations:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CGFloat v15 = [(TTKTestCaseSource *)self->_source layouts];
  uint64_t v5 = [v4 keyplane];
  uint64_t v16 = [v5 name];

  uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v15;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        CGFloat v11 = [v6 objectForKey:v10];
        double v12 = [v11 keys];
        CGFloat v13 = [(UserPathManager *)self translateLayoutForKeys:v12 keyboardController:v4];
        if (v13) {
          [v17 setObject:v13 forKey:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_transforms setObject:v17 forKey:v16];
  return 1;
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  m_generator = self->m_generator;
  _DWORD *m_generator = a3;
  for (uint64_t i = 1; i != 624; ++i)
  {
    a3 = i + 1812433253 * (a3 ^ (a3 >> 30));
    m_generator[i] = a3;
  }
  *((void *)m_generator + 312) = 0;
}

- (void)dealloc
{
  m_generator = self->m_generator;
  if (m_generator) {
    MEMORY[0x2455C26F0](m_generator, 0x1000C407BAC9B3ELL);
  }
  v4.receiver = self;
  v4.super_class = (Class)UserPathManager;
  [(UserPathManager *)&v4 dealloc];
}

- (UserPathManager)initWithPathFile:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UserPathManager;
  id v6 = [(UserPathManager *)&v16 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathFile, a3);
    uint64_t v8 = +[TTKTestCaseReader loadFromPath:v5];
    source = v7->_source;
    v7->_source = (TTKTestCaseSource *)v8;

    if (v7->_source)
    {
      uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
      transforms = v7->_transforms;
      v7->_transforms = (NSMutableDictionary *)v10;

      uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
      lookupTree = v7->_lookupTree;
      v7->_lookupTree = (NSMutableDictionary *)v12;

      [(UserPathManager *)v7 buildLookupTree];
      operator new();
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "Error: Unable to parse user path JSON file '%s'\n\n", (const char *)[v5 cStringUsingEncoding:4]);
    double v14 = 0;
  }
  else
  {
    double v14 = (UserPathManager *)0;
  }

  return v14;
}

@end