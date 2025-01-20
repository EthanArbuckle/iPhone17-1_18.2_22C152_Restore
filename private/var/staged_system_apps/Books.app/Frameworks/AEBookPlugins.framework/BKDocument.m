@interface BKDocument
+ (id)documentKeyWithHref:(id)a3 documentOrdinal:(id)a4;
+ (id)newEmptyDocument:(id)a3;
- (BOOL)hasMediaOverlayElements;
- (CGRect)estimatedFixedLayoutViewFrame;
- (CGSize)fixedLayoutSize;
- (id)documentKey;
- (id)mediaOverlayElements;
- (int64_t)unboxedDocumentOrdinal;
- (unint64_t)linearDocumentIndex;
- (void)copyPropertiesFrom:(id)a3;
- (void)setLinearDocumentIndex:(unint64_t)a3;
@end

@implementation BKDocument

- (CGRect)estimatedFixedLayoutViewFrame
{
  v3 = [(BKDocument *)self fixedLayoutWidth];
  [v3 doubleValue];
  double v5 = v4;

  v6 = [(BKDocument *)self fixedLayoutHeight];
  [v6 doubleValue];
  double v8 = v7;

  if (v5 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_137608();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1375C0();
    }
  }
  else if (v8 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_137520();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1374D8();
    }
  }
  else
  {
    v9 = +[UIScreen mainScreen];
    [v9 bounds];
  }
  CGFloat y = CGRectZero.origin.y;
  IMSizeRound();
  double v12 = v11;
  double v14 = v13;
  double x = CGRectZero.origin.x;
  double v16 = y;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.CGFloat y = v16;
  result.origin.double x = x;
  return result;
}

- (CGSize)fixedLayoutSize
{
  v3 = [(BKDocument *)self fixedLayoutWidth];
  [v3 doubleValue];
  double v5 = v4;
  v6 = [(BKDocument *)self fixedLayoutHeight];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)copyPropertiesFrom:(id)a3
{
  id v4 = a3;
  double v5 = [v4 bookDatabaseKey];
  [(BKDocument *)self setBookDatabaseKey:v5];

  v6 = [v4 href];
  [(BKDocument *)self setHref:v6];

  double v7 = [v4 mime];
  [(BKDocument *)self setMime:v7];

  double v8 = [v4 compressionAlgorithm];
  [(BKDocument *)self setCompressionAlgorithm:v8];

  double v9 = [v4 encryptionAlgorithm];
  [(BKDocument *)self setEncryptionAlgorithm:v9];

  double v10 = [v4 documentOrdinal];
  [(BKDocument *)self setDocumentOrdinal:v10];

  double v11 = [v4 fileSize];
  [(BKDocument *)self setFileSize:v11];

  double v12 = [v4 hasTocElements];
  [(BKDocument *)self setHasTocElements:v12];

  double v13 = [v4 hasLandmarkElements];
  [(BKDocument *)self setHasLandmarkElements:v13];

  double v14 = [v4 hasPhysicalElements];
  [(BKDocument *)self setHasPhysicalElements:v14];

  v15 = [v4 nonlinearElement];
  [(BKDocument *)self setNonlinearElement:v15];

  double v16 = [v4 mediaOverlayHref];
  [(BKDocument *)self setMediaOverlayHref:v16];

  v17 = [v4 mediaOverlayParsed];
  [(BKDocument *)self setMediaOverlayParsed:v17];

  v18 = [v4 sinfNumber];
  [(BKDocument *)self setSinfNumber:v18];

  v19 = [v4 fallbackId];
  [(BKDocument *)self setFallbackId:v19];

  v20 = [v4 manifestId];
  [(BKDocument *)self setManifestId:v20];

  v21 = [v4 manifestProperties];
  [(BKDocument *)self setManifestProperties:v21];

  v22 = [v4 orthography];
  [(BKDocument *)self setOrthography:v22];

  id v23 = [v4 isDuplicateSpineEntry];

  [(BKDocument *)self setIsDuplicateSpineEntry:v23];
}

+ (id)newEmptyDocument:(id)a3
{
  id v3 = a3;
  id v4 = [v3 newByClass:objc_opt_class()];

  return v4;
}

- (BOOL)hasMediaOverlayElements
{
  v2 = [(BKDocument *)self mediaOverlayHref];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)mediaOverlayElements
{
  if ([(BKDocument *)self hasMediaOverlayElements])
  {
    BOOL v3 = [(BKDocument *)self mediaOverlayParsed];
    unsigned __int8 v4 = [v3 BOOLValue];

    if ((v4 & 1) == 0)
    {
      double v5 = [(BKDocument *)self managedObjectContext];
      v6 = [(BKDocument *)self bookDatabaseKey];
      double v7 = +[AEBookInfo bookFromDatabaseKey:v6 withMOC:v5];

      if (v7)
      {
        double v8 = [v7 bookContentSubpath];
        double v9 = [v7 basePlusContentPath];
        double v10 = [v7 basePlusContentPath];
        double v11 = [(BKDocument *)self mediaOverlayHref];
        double v12 = [v10 stringByAppendingPathComponent:v11];

        double v13 = [(BKDocument *)self bookDatabaseKey];
        uint64_t v14 = +[BKMediaOverlayElement parseSMIL:v12 contentSubpath:v8 bookBasePath:v9 bookDatabaseKey:v13 managedObjectContext:v5];

        if (v14)
        {
          NSLog(@"SMIL Parsing failed: %d Path: %@", v14, v12);
        }
        else
        {
          double v16 = +[NSNumber numberWithBool:1];
          [(BKDocument *)self setMediaOverlayParsed:v16];

          [v5 save:0];
        }
      }
    }
    v17 = [(BKDocument *)self href];
    v18 = [(BKDocument *)self bookDatabaseKey];
    v19 = +[NSPredicate predicateWithFormat:@"documentHref == %@ AND bookDatabaseKey == %@", v17, v18];

    v20 = [(BKDocument *)self managedObjectContext];
    v15 = [v20 entity:@"BKMediaOverlayElement" withPredicate:v19 sortBy:@"documentAbsoluteOrder" ascending:1 fetchLimit:0];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)documentKeyWithHref:(id)a3 documentOrdinal:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_22B630 == -1)
  {
    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_22B630, &stru_1DD220);
    if (!v5) {
      goto LABEL_6;
    }
  }
  if (v6)
  {
    id v7 = +[NSString stringWithFormat:@"%@:%@", v5, v6];
    goto LABEL_7;
  }
LABEL_6:
  id v7 = v5;
LABEL_7:
  double v8 = v7;

  return v8;
}

- (id)documentKey
{
  BOOL v3 = objc_opt_class();
  unsigned __int8 v4 = [(BKDocument *)self href];
  id v5 = [(BKDocument *)self documentOrdinal];
  id v6 = [v3 documentKeyWithHref:v4 documentOrdinal:v5];

  return v6;
}

- (int64_t)unboxedDocumentOrdinal
{
  v2 = [(BKDocument *)self documentOrdinal];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (unint64_t)linearDocumentIndex
{
  return self->linearDocumentIndex;
}

- (void)setLinearDocumentIndex:(unint64_t)a3
{
  self->linearDocumentIndedouble x = a3;
}

@end