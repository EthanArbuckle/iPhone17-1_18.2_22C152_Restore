@interface CRLHandwritingRecognitionStatusHelper
- (CRLHandwritingRecognitionStatusHelper)initWithFreehandDrawingItems:(id)a3 andConsolidatedDrawing:(id)a4;
- (CRLHandwritingRecognitionStatusHelperDelegate)delegate;
- (NSArray)drawings;
- (NSDictionary)recognitionStatusStrings;
- (OS_dispatch_queue)recognitionQueue;
- (PKDrawing)consolidatedDrawing;
- (id)p_bodyStringForString:(id)a3;
- (id)p_headlineStringForString:(id)a3;
- (id)p_idStringForDrawing:(id)a3;
- (id)p_recognitionStatusStringsForDrawing:(id)a3;
- (id)p_titleStringForString:(id)a3;
- (int64_t)refreshCount;
- (void)copyDebugStringToPasteboard;
- (void)p_appendAttributedTextForDrawing:(id)a3 drawingResults:(id)a4 to:(id)a5;
- (void)refresh;
- (void)setConsolidatedDrawing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawings:(id)a3;
- (void)setRecognitionQueue:(id)a3;
- (void)setRecognitionStatusStrings:(id)a3;
- (void)setRefreshCount:(int64_t)a3;
@end

@implementation CRLHandwritingRecognitionStatusHelper

- (CRLHandwritingRecognitionStatusHelper)initWithFreehandDrawingItems:(id)a3 andConsolidatedDrawing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CRLHandwritingRecognitionStatusHelper;
  v8 = [(CRLHandwritingRecognitionStatusHelper *)&v22 init];
  if (v8)
  {
    v9 = +[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v14) pkRecognitionController:v18];
          v16 = [v15 drawing];

          [v9 crl_addNonNilObject:v16];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    [(CRLHandwritingRecognitionStatusHelper *)v8 setDrawings:v9];
    [(CRLHandwritingRecognitionStatusHelper *)v8 setConsolidatedDrawing:v7];
    [(CRLHandwritingRecognitionStatusHelper *)v8 setRefreshCount:0];
  }
  return v8;
}

- (OS_dispatch_queue)recognitionQueue
{
  recognitionQueue = self->_recognitionQueue;
  if (!recognitionQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.freeform.handwriting-debug-recognition-queue", v4);
    id v6 = self->_recognitionQueue;
    self->_recognitionQueue = v5;

    recognitionQueue = self->_recognitionQueue;
  }

  return recognitionQueue;
}

- (void)copyDebugStringToPasteboard
{
  id v3 = objc_alloc_init((Class)NSMutableAttributedString);
  v5 = [(CRLHandwritingRecognitionStatusHelper *)self recognitionStatusStrings];
  id v6 = [v5 mutableCopy];

  id v7 = [v6 objectForKeyedSubscript:@"CRLPKDrawingCombinedStatus"];
  if (v7)
  {
    [(CRLHandwritingRecognitionStatusHelper *)self p_appendAttributedTextForDrawing:@"Consolidated Board Drawing" drawingResults:v7 to:v3];
    [v6 removeObjectForKey:@"CRLPKDrawingCombinedStatus"];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10023700C;
  v20[3] = &unk_1014E4090;
  v20[4] = self;
  v20[5] = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v20];

  id v8 = [v3 length];
  NSAttributedStringDocumentAttributeKey v24 = NSDocumentTypeDocumentAttribute;
  NSAttributedStringDocumentType v25 = NSRTFTextDocumentType;
  v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v19 = 0;
  id v10 = [v3 dataFromRange:0 documentAttributes:v8 error:&v19];
  id v11 = v19;

  if (!v11)
  {
    id v12 = +[CRLPasteboard generalPasteboard];
    [v12 clearContents];

    uint64_t v13 = +[CRLPasteboard generalPasteboard];
    v14 = [UTTypeRTF identifier];
    long long v21 = v14;
    objc_super v22 = v10;
    v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v23 = v15;
    v16 = +[NSArray arrayWithObjects:&v23 count:1];
    [v13 addItems:v16];

    v17 = +[CRLPasteboard generalPasteboard];
    long long v18 = [v17 richTextStrings];

    NSLog(@"%@", v18);
  }
}

- (void)p_appendAttributedTextForDrawing:(id)a3 drawingResults:(id)a4 to:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CRLHandwritingRecognitionStatusHelper *)self p_titleStringForString:a3];
  [v9 appendAttributedString:v10];

  id v11 = [v8 allKeys];
  id v12 = [v11 sortedArrayUsingComparator:&stru_1014E40B0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v19 = -[CRLHandwritingRecognitionStatusHelper p_headlineStringForString:](self, "p_headlineStringForString:", v18, (void)v23);
        [v9 appendAttributedString:v19];

        long long v20 = [v8 objectForKeyedSubscript:v18];
        long long v21 = [(CRLHandwritingRecognitionStatusHelper *)self p_bodyStringForString:v20];
        [v9 appendAttributedString:v21];

        objc_super v22 = [(CRLHandwritingRecognitionStatusHelper *)self p_bodyStringForString:@"\n"];
        [v9 appendAttributedString:v22];
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
}

- (id)p_titleStringForString:(id)a3
{
  NSAttributedStringKey v10 = NSFontAttributeName;
  id v3 = a3;
  v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
  id v11 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  id v6 = objc_alloc((Class)NSAttributedString);
  id v7 = [v3 stringByAppendingString:@"\n"];

  id v8 = [v6 initWithString:v7 attributes:v5];

  return v8;
}

- (id)p_headlineStringForString:(id)a3
{
  NSAttributedStringKey v10 = NSFontAttributeName;
  id v3 = a3;
  v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  id v11 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  id v6 = objc_alloc((Class)NSAttributedString);
  id v7 = [v3 stringByAppendingString:@"\n"];

  id v8 = [v6 initWithString:v7 attributes:v5];

  return v8;
}

- (id)p_bodyStringForString:(id)a3
{
  NSAttributedStringKey v10 = NSFontAttributeName;
  id v3 = a3;
  v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v11 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  id v6 = objc_alloc((Class)NSAttributedString);
  id v7 = [v3 stringByAppendingString:@"\n"];

  id v8 = [v6 initWithString:v7 attributes:v5];

  return v8;
}

- (void)refresh
{
  id v3 = [(CRLHandwritingRecognitionStatusHelper *)self consolidatedDrawing];

  if (v3)
  {
    v4 = [(CRLHandwritingRecognitionStatusHelper *)self consolidatedDrawing];
    [v4 setRecognitionEnabled:1];

    v5 = [(CRLHandwritingRecognitionStatusHelper *)self consolidatedDrawing];
    id v6 = [v5 visualizationManager];
    [v6 setRecognitionStatusReportingEnabled:1];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(CRLHandwritingRecognitionStatusHelper *)self drawings];
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v12 setRecognitionEnabled:1];
        id v13 = [v12 visualizationManager];
        [v13 setRecognitionStatusReportingEnabled:1];
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  id v14 = [(CRLHandwritingRecognitionStatusHelper *)self drawings];
  id v15 = [v14 copy];

  uint64_t v16 = [(CRLHandwritingRecognitionStatusHelper *)self recognitionQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100237784;
  v18[3] = &unk_1014CBE78;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  dispatch_async(v16, v18);
}

- (id)p_idStringForDrawing:(id)a3
{
  id v3 = [a3 uuid];
  v4 = +[NSString localizedStringWithFormat:@"%@", v3];

  return v4;
}

- (id)p_recognitionStatusStringsForDrawing:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E40D0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108EC74(v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E40F0);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v6, v4);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHandwritingRecognitionStatusHelper p_recognitionStatusStringsForDrawing:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLHandwritingRecognitionStatusHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 193, 0, "invalid nil value for '%{public}s'", "drawing");
  }
  long long v21 = v3;
  id v9 = [v3 visualizationManager];
  uint64_t v10 = +[NSMutableDictionary dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = +[PKVisualizationManager availableRecognitionStatusKeys];
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v17 = +[PKVisualizationManager localizedNameForRecognitionStatusKey:v16];
        uint64_t v18 = [v9 valueForRecognitionStatusKey:v16];
        if (v18)
        {
          if (v17) {
            id v19 = v17;
          }
          else {
            id v19 = v16;
          }
          [v10 setObject:v18 forKeyedSubscript:v19];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v10;
}

- (NSDictionary)recognitionStatusStrings
{
  return self->_recognitionStatusStrings;
}

- (void)setRecognitionStatusStrings:(id)a3
{
}

- (CRLHandwritingRecognitionStatusHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLHandwritingRecognitionStatusHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)drawings
{
  return self->_drawings;
}

- (void)setDrawings:(id)a3
{
}

- (PKDrawing)consolidatedDrawing
{
  return self->_consolidatedDrawing;
}

- (void)setConsolidatedDrawing:(id)a3
{
}

- (void)setRecognitionQueue:(id)a3
{
}

- (int64_t)refreshCount
{
  return self->_refreshCount;
}

- (void)setRefreshCount:(int64_t)a3
{
  self->_refreshCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_consolidatedDrawing, 0);
  objc_storeStrong((id *)&self->_drawings, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_recognitionStatusStrings, 0);
}

@end