@interface CRLTextBoxingBoardItemProvider
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate;
- (CRLProgress)progress;
- (CRLTextBoxingBoardItemProvider)initWithRichTextString:(id)a3 geometry:(id)a4;
- (CRLTextBoxingBoardItemProvider)initWithTextStorage:(id)a3 geometry:(id)a4;
- (CRLTextBoxingBoardItemProvider)initWithTextString:(id)a3 geometry:(id)a4;
- (NSDictionary)pasteboardDescription;
- (NSError)error;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4;
- (unint64_t)embeddedDataLength;
- (unint64_t)uploadDataLength;
- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CRLTextBoxingBoardItemProvider

- (CRLTextBoxingBoardItemProvider)initWithTextStorage:(id)a3 geometry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLTextBoxingBoardItemProvider;
  v9 = [(CRLTextBoxingBoardItemProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textStorage, a3);
    objc_storeStrong((id *)&v10->_geometry, a4);
  }

  return v10;
}

- (CRLTextBoxingBoardItemProvider)initWithTextString:(id)a3 geometry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLTextBoxingBoardItemProvider;
  v9 = [(CRLTextBoxingBoardItemProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textString, a3);
    objc_storeStrong((id *)&v10->_geometry, a4);
  }

  return v10;
}

- (CRLTextBoxingBoardItemProvider)initWithRichTextString:(id)a3 geometry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLTextBoxingBoardItemProvider;
  v9 = [(CRLTextBoxingBoardItemProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_richTextString, a3);
    objc_storeStrong((id *)&v10->_geometry, a4);
  }

  return v10;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)+[NSString readableTypeIdentifiersForItemProvider];
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v15 = 0;
  v6 = +[NSString crl_stringWithItemProviderData:a3 typeIdentifier:a4 error:&v15];
  id v7 = v15;
  if (!v7) {
    goto LABEL_7;
  }
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014CFBE0);
  }
  id v8 = off_10166B498;
  if (!os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
  {
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  sub_10106DEFC(v8, v7);
  if (a5) {
LABEL_6:
  }
    *a5 = v7;
LABEL_7:
  if (v6)
  {
    v9 = [CRLCanvasInfoGeometry alloc];
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v14[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v14[1] = v10;
    v14[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v11 = [(CRLCanvasInfoGeometry *)v9 initWithFullTransform:v14 widthValid:0 heightValid:0];
    objc_super v12 = [[CRLTextBoxingBoardItemProvider alloc] initWithTextString:v6 geometry:v11];
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4
{
  id v5 = a3;
  v6 = v5;
  if (!self->_textStorage)
  {
    if (self->_textString)
    {
LABEL_4:
      uint64_t v7 = [v6 makeTextboxItemWithString:];
      goto LABEL_7;
    }
    if (!self->_richTextString)
    {
      int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CFC00);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106DFF0(v10, v11);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CFC20);
      }
      objc_super v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v12, v10);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTextBoxingBoardItemProvider newBoardItemWithFactory:bakedSize:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLTextBoxingBoardItemProvider.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:95 isFatal:0 description:"Either the plain text string or the rich text string should be non-nil"];

      if (self->_textString) {
        goto LABEL_4;
      }
      if (!self->_richTextString)
      {
        id v8 = 0;
        goto LABEL_8;
      }
    }
    uint64_t v7 = [v6 makeTextboxItemWithAttributedString:];
    goto LABEL_7;
  }
  uint64_t v7 = [v5 makeTextBoxItemWithStorage:];
LABEL_7:
  id v8 = (void *)v7;
LABEL_8:
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(CRLIngestibleItemImportableBoardItemProviderDelegate *)self->delegate importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:self];
  }

  return v8;
}

- (NSDictionary)pasteboardDescription
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4
{
  id v9 = a4;
  v6 = [(CRLTextBoxingBoardItemProvider *)self newBoardItemWithFactory:a3 bakedSize:1];
  boardItem = self->_boardItem;
  self->_boardItem = v6;

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return self->_boardItem;
}

- (NSError)error
{
  return self->_error;
}

- (CRLProgress)progress
{
  return self->progress;
}

- (unint64_t)uploadDataLength
{
  return self->uploadDataLength;
}

- (unint64_t)embeddedDataLength
{
  return self->embeddedDataLength;
}

- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (CRLIngestibleItemImportableBoardItemProviderDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->progress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_richTextString, 0);
  objc_storeStrong((id *)&self->_textString, 0);

  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end