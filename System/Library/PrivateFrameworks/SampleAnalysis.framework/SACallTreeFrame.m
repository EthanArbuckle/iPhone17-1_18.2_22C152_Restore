@interface SACallTreeFrame
+ (id)callTreeFrameWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6;
+ (void)enumerateTree:(void *)a3 block:;
- (BOOL)isTruncatedLeafCallstack;
- (NSArray)childFrames;
- (SACallTreeFrame)initWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6;
- (SAFrame)frame;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SACallTreeFrame

- (SAFrame)frame
{
  return (SAFrame *)objc_getProperty(self, a2, 32, 1);
}

- (SACallTreeFrame)initWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6
{
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SACallTreeFrame;
  v12 = [(SACallTreeNode *)&v17 initWithStartSampleIndex:a4 sampleCount:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_frame, a3);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    children = v13->_children;
    v13->_children = v14;

    v13->_isLeafFrame = a6;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

+ (id)callTreeFrameWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithFrame:v10 startSampleIndex:a4 sampleCount:a5 isLeafFrame:v6];

  return v11;
}

- (BOOL)isTruncatedLeafCallstack
{
  return 0;
}

- (NSArray)childFrames
{
  return (NSArray *)FilterArrayToCallTreeFrames(self->_children);
}

+ (void)enumerateTree:(void *)a3 block:
{
  id v4 = a2;
  v5 = a3;
  self;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v7 = (void *)[v4 mutableCopy];
  v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

  if ([v8 count])
  {
    uint64_t v9 = 0;
    id v10 = v5 + 16;
    id v11 = sel_initWithStartSampleIndex_sampleCount_;
    while (1)
    {
      uint64_t v12 = [v8 lastObject];
      if (!v12) {
        goto LABEL_29;
      }
      v13 = (void *)v12;
      while (![v13 count])
      {
        uint64_t v9 = (v9 - 1);
        [v8 removeLastObject];
        uint64_t v14 = [v8 lastObject];

        v13 = (void *)v14;
        if (!v14) {
          goto LABEL_29;
        }
      }
      v15 = [v13 firstObject];
      [v13 removeObjectAtIndex:0];
      char v38 = 0;
      (*((void (**)(char *, void *, uint64_t, char *))v5 + 2))(v5, v15, v9, &v38);
      if (v38)
      {

        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = v10;
        v37 = v11;
        v22 = v15;
        v23 = [SACallTreeStateChildren alloc];
        uint64_t v35 = [v22 startSampleIndex];
        uint64_t v34 = [v22 sampleCount];
        if (v22)
        {
          id v25 = objc_getProperty(v22, v24, 88, 1);
          id v27 = objc_getProperty(v22, v26, 80, 1);
          LODWORD(v32) = v22[10];
          HIDWORD(v32) = v22[9];
        }
        else
        {
          uint64_t v32 = 0;
          id v25 = 0;
          id v27 = 0;
        }
        id obj = v25;
        id v28 = v25;
        id v29 = v27;
        if (v23)
        {
          v39.receiver = v23;
          v39.super_class = (Class)SACallTreeStateChildren;
          v30 = (SACallTreeStateChildren *)objc_msgSendSuper2(&v39, v37, v35, v34);
          v23 = v30;
          if (v30)
          {
            objc_storeStrong((id *)&v30->_timeRanges, obj);
            objc_storeStrong((id *)&v23->_ioEvents, v27);
            v23->_originPid = HIDWORD(v32);
            v23->_proximatePid = v32;
          }
        }
        id v10 = v36;

        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v23, 0);
        [v8 addObject:v31];

        uint64_t v9 = (v9 + 1);
        id v11 = (char *)v37;
        goto LABEL_23;
      }
LABEL_24:

      if (![v8 count]) {
        goto LABEL_29;
      }
    }
    id Property = v15;
    v18 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v17, 40, 1);
    }
    if ([Property count])
    {
      if (v18) {
        id v20 = objc_getProperty(v18, v19, 40, 1);
      }
      else {
        id v20 = 0;
      }
      v21 = (void *)[v20 mutableCopy];
      [v8 addObject:v21];

      uint64_t v9 = (v9 + 1);
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_29:
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  frame = self->_frame;
  id v5 = a3;
  [(SAFrame *)frame writeJSONDictionaryEntriesToStream:v5];
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SACallTreeNode sampleCount](self, "sampleCount"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, @"count", v6);
}

@end