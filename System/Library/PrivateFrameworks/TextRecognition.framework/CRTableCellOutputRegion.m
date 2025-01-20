@interface CRTableCellOutputRegion
- (BOOL)contributesToDocumentHierarchy;
- (BOOL)shouldAlwaysAddDelimiter;
- (CRTableCellOutputRegion)initWithBlock:(id)a3 quad:(id)a4 rowRange:(_NSRange)a5 colRange:(_NSRange)a6;
- (CRTableCellOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (_NSRange)colRange;
- (_NSRange)rowRange;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (id)layoutComponents;
- (unint64_t)type;
- (void)setColRange:(_NSRange)a3;
- (void)setRowRange:(_NSRange)a3;
@end

@implementation CRTableCellOutputRegion

- (CRTableCellOutputRegion)initWithBlock:(id)a3 quad:(id)a4 rowRange:(_NSRange)a5 colRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v8 = a5.length;
  NSUInteger v9 = a5.location;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = [(CROutputRegion *)self init];
  if (v14)
  {
    [v13 baselineAngle];
    -[CROutputRegion setBaselineAngle:](v14, "setBaselineAngle:");
    -[CROutputRegion setConfidence:](v14, "setConfidence:", [v12 confidence]);
    [(CROutputRegion *)v14 setBoundingQuad:v13];
    [(CROutputRegion *)v14 setShouldComputeBoundsFromChildren:0];
    [(CROutputRegion *)v14 setShouldComputeTranscriptFromChildren:1];
    v17[0] = v12;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(CROutputRegion *)v14 setChildren:v15];

    -[CRTableCellOutputRegion setRowRange:](v14, "setRowRange:", v9, v8);
    -[CRTableCellOutputRegion setColRange:](v14, "setColRange:", location, length);
  }

  return v14;
}

- (CRTableCellOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRTableCellOutputRegion;
  NSUInteger v9 = [(CROutputRegion *)&v15 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v9)
  {
    if (a4 >= 3) {
      +[CRCodingUtilities integerFromEncodingData:v8 offset:a5];
    }
    uint64_t v10 = +[CRCodingUtilities rangeFromEncodingData:v8 offset:a5];
    -[CRTableCellOutputRegion setRowRange:](v9, "setRowRange:", v10, v11);
    uint64_t v12 = +[CRCodingUtilities rangeFromEncodingData:v8 offset:a5];
    -[CRTableCellOutputRegion setColRange:](v9, "setColRange:", v12, v13);
  }

  return v9;
}

- (unint64_t)type
{
  return 128;
}

- (BOOL)shouldAlwaysAddDelimiter
{
  return 1;
}

- (id)crCodableDataRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v11.receiver = self;
  v11.super_class = (Class)CRTableCellOutputRegion;
  v4 = [(CROutputRegion *)&v11 crCodableDataRepresentation];
  v5 = [v3 dataWithData:v4];

  +[CRCodingUtilities appendInteger:1 toData:v5];
  uint64_t v6 = [(CRTableCellOutputRegion *)self rowRange];
  +[CRCodingUtilities appendRange:toData:](CRCodingUtilities, "appendRange:toData:", v6, v7, v5);
  uint64_t v8 = [(CRTableCellOutputRegion *)self colRange];
  +[CRCodingUtilities appendRange:toData:](CRCodingUtilities, "appendRange:toData:", v8, v9, v5);
  return v5;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (id)layoutComponents
{
  return [(CROutputRegion *)self contentsWithTypes:4];
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CRTableCellOutputRegion;
  id v7 = [(CROutputRegion *)&v13 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  uint64_t v8 = [(CRTableCellOutputRegion *)self rowRange];
  objc_msgSend(v7, "setRowRange:", v8, v9);
  uint64_t v10 = [(CRTableCellOutputRegion *)self colRange];
  objc_msgSend(v7, "setColRange:", v10, v11);
  return v7;
}

- (_NSRange)rowRange
{
  objc_copyStruct(v4, &self->_rowRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setRowRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_rowRange, &v3, 16, 1, 0);
}

- (_NSRange)colRange
{
  objc_copyStruct(v4, &self->_colRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setColRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_colRange, &v3, 16, 1, 0);
}

@end