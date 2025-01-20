@interface TSTSearchReference
+ (TSTSearchReference)searchReferenceWithTableInfo:(id)a3 cellID:(id)a4 range:(_NSRange)a5;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID;
- (BOOL)autohideHighlight;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplaceable;
- (BOOL)pulseHighlight;
- (CGPoint)searchReferencePoint;
- (NSArray)findHighlights;
- (NSString)description;
- (TSKAnnotation)annotation;
- (TSTSearchReference)initWithTableInfo:(id)a3 cellID:(id)a4 range:(_NSRange)a5;
- (_NSRange)range;
- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)model;
- (id)searchReferenceEnd;
- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4 authorCreatedWithCommand:(id *)a5;
- (id)searchReferenceStart;
- (id)selection;
- (id)tableInfo;
- (void)dealloc;
- (void)setAnnotation:(id)a3;
- (void)setAutohideHighlight:(BOOL)a3;
- (void)setCellID:(id)a3;
- (void)setFindHighlights:(id)a3;
- (void)setPulseHighlight:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSearchReferencePoint:(CGPoint)a3;
@end

@implementation TSTSearchReference

+ (TSTSearchReference)searchReferenceWithTableInfo:(id)a3 cellID:(id)a4 range:(_NSRange)a5
{
  v5 = -[TSTSearchReference initWithTableInfo:cellID:range:]([TSTSearchReference alloc], "initWithTableInfo:cellID:range:", a3, *(unsigned int *)&a4, a5.location, a5.length);

  return v5;
}

- (TSTSearchReference)initWithTableInfo:(id)a3 cellID:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v11.receiver = self;
  v11.super_class = (Class)TSTSearchReference;
  v9 = [(TSTSearchReference *)&v11 init];
  if (v9)
  {
    v9->_tableInfo = (TSTTableInfo *)a3;
    v9->_cellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a4;
    v9->_range.NSUInteger location = location;
    v9->_range.NSUInteger length = length;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTSearchReference;
  [(TSTSearchReference *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(TSTSearchReference *)self model];
  uint64_t v6 = [a3 model];
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;
  uint64_t v9 = [a3 range];
  uint64_t v11 = v10;
  $5CFCD363C99B2F51819B67AD7AD2E060 cellID = self->_cellID;
  return (([a3 cellID] ^ *(_DWORD *)&cellID) & 0xFFFFFF) == 0
      && v5 == (id)v6
      && location == v9
      && length == v11;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCellID:(id)a3
{
  self->_$5CFCD363C99B2F51819B67AD7AD2E060 cellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->_cellID;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (uint64_t)[(TSTSearchReference *)self cellID];
  return (NSString *)[v3 stringWithFormat:@"TSTSearchReference %p cellID %@ range %@", self, objc_msgSend(NSString, "stringWithFormat:", @"(%hu, %hu)", BYTE2(v4), (unsigned __int16)v4), NSStringFromRange(self->_range)];
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (id)model
{
  return self->_tableInfo;
}

- (id)tableInfo
{
  return self->_tableInfo;
}

- (id)selection
{
  objc_super v3 = [[TSTTableSelection alloc] initWithTableModel:[(TSTTableInfo *)self->_tableInfo tableModel] andCellID:*(_DWORD *)&self->_cellID];
  -[TSTTableSelection setSearchReferenceRange:](v3, "setSearchReferenceRange:", self->_range.location, self->_range.length);
  return v3;
}

- (BOOL)isReplaceable
{
  tableInfo = self->_tableInfo;
  if (!tableInfo)
  {
LABEL_6:
    uint64_t v4 = objc_alloc_init(TSTCell);
    if (TSTCellAtCellID((uint64_t)[(TSTTableInfo *)self->_tableInfo tableModel], *(_DWORD *)&self->_cellID, v4)|| !self->_range.length)
    {
      goto LABEL_7;
    }
    p_mCurrentCellFormat = ($F03D4CA5AAEDD23196D77D4402B24C2D *)&TSUInvalidFormat;
    if (v4) {
      p_mCurrentCellFormat = &v4->mPrivate.mCellFormats.mCurrentCellFormat;
    }
    if (v4->mPrivate.mCellFormats.mCurrentCellFormatID) {
      BOOL v8 = v4->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType == 266;
    }
    else {
      BOOL v8 = 0;
    }
    LOBYTE(v5) = 0;
    if (v8 || p_mCurrentCellFormat->mFormatType == 267) {
      goto LABEL_8;
    }
    int mPrivate = (int)v4->mPrivate;
    if (BYTE1(mPrivate) > 9u) {
LABEL_7:
    }
      LOBYTE(v5) = 0;
    else {
      unsigned int v5 = (0x2ECu >> SBYTE1(mPrivate)) & 1;
    }
LABEL_8:

    return v5;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(TSDDrawableInfo *)tableInfo isLocked]) {
      break;
    }
    tableInfo = [(TSDDrawableInfo *)tableInfo parentInfo];
    if (!tableInfo) {
      goto LABEL_6;
    }
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4 authorCreatedWithCommand:(id *)a5
{
  tableInfo = self->_tableInfo;
  uint64_t cellID = self->_cellID;
  uint64_t v8 = [(TSTSearchReference *)self range];
  uint64_t v9 = [a3 length];

  return +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", tableInfo, cellID, v8, v9);
}

- (id)searchReferenceStart
{
  tableInfo = self->_tableInfo;
  uint64_t cellID = self->_cellID;
  uint64_t v4 = [(TSTSearchReference *)self range];

  return +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", tableInfo, cellID, v4, 0);
}

- (id)searchReferenceEnd
{
  tableInfo = self->_tableInfo;
  uint64_t cellID = self->_cellID;
  uint64_t v4 = [(TSTSearchReference *)self range];

  return +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", tableInfo, cellID, v4 + v5, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = -[TSTSearchReference initWithTableInfo:cellID:range:]([TSTSearchReference alloc], "initWithTableInfo:cellID:range:", self->_tableInfo, *(_DWORD *)&self->_cellID, self->_range.location, self->_range.length);
  [(TSTSearchReference *)self searchReferencePoint];
  -[TSTSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
  return v4;
}

- (NSArray)findHighlights
{
  return self->_findHighlights;
}

- (void)setFindHighlights:(id)a3
{
}

- (BOOL)autohideHighlight
{
  return self->_autohideHighlight;
}

- (void)setAutohideHighlight:(BOOL)a3
{
  self->_autohideHighlight = a3;
}

- (BOOL)pulseHighlight
{
  return self->_pulseHighlight;
}

- (void)setPulseHighlight:(BOOL)a3
{
  self->_pulseHighlight = a3;
}

- (CGPoint)searchReferencePoint
{
  double x = self->searchReferencePoint.x;
  double y = self->searchReferencePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->searchReferencePoint = a3;
}

- (TSKAnnotation)annotation
{
  return self->annotation;
}

- (void)setAnnotation:(id)a3
{
}

@end