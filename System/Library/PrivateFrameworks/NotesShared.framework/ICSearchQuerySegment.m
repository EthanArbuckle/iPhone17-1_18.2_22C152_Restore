@interface ICSearchQuerySegment
- (BOOL)isExpandable;
- (ICSearchQuerySegment)initWithSegmentString:(id)a3 range:(_NSRange)a4 type:(unint64_t)a5 isExpandable:(BOOL)a6;
- (NSString)segmentString;
- (_NSRange)segmentRange;
- (id)description;
- (unint64_t)type;
- (void)setIsExpandable:(BOOL)a3;
- (void)setSegmentRange:(_NSRange)a3;
- (void)setSegmentString:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation ICSearchQuerySegment

- (ICSearchQuerySegment)initWithSegmentString:(id)a3 range:(_NSRange)a4 type:(unint64_t)a5 isExpandable:(BOOL)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICSearchQuerySegment;
  v13 = [(ICSearchQuerySegment *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_segmentString, a3);
    v14->_segmentRange.NSUInteger location = location;
    v14->_segmentRange.NSUInteger length = length;
    v14->_type = a5;
    v14->_isExpandable = a6;
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(ICSearchQuerySegment *)self type];
  v5 = [(ICSearchQuerySegment *)self segmentString];
  v12.NSUInteger location = [(ICSearchQuerySegment *)self segmentRange];
  v6 = NSStringFromRange(v12);
  BOOL v7 = [(ICSearchQuerySegment *)self isExpandable];
  v8 = &stru_1F1F2FFF8;
  if (v7) {
    v8 = @"expandable";
  }
  v9 = [v3 stringWithFormat:@"type=%lu: %@ @ %@, %@", v4, v5, v6, v8];

  return v9;
}

- (NSString)segmentString
{
  return self->_segmentString;
}

- (void)setSegmentString:(id)a3
{
}

- (_NSRange)segmentRange
{
  NSUInteger length = self->_segmentRange.length;
  NSUInteger location = self->_segmentRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSegmentRange:(_NSRange)a3
{
  self->_segmentRange = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isExpandable
{
  return self->_isExpandable;
}

- (void)setIsExpandable:(BOOL)a3
{
  self->_isExpandable = a3;
}

- (void).cxx_destruct
{
}

@end