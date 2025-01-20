@interface _UIWritingToolsReplacementChunk
- (NSAttributedString)replacement;
- (NSUUID)uuid;
- (_NSRange)originalRange;
- (_UIWritingToolsReplacementChunk)initWithReplacementChunk:(id)a3 originalRange:(_NSRange)a4 uuid:(id)a5;
- (id)description;
- (int64_t)lengthDelta;
- (int64_t)originalEndIndex;
@end

@implementation _UIWritingToolsReplacementChunk

- (_UIWritingToolsReplacementChunk)initWithReplacementChunk:(id)a3 originalRange:(_NSRange)a4 uuid:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_UIWritingToolsReplacementChunk;
  v12 = [(_UIWritingToolsReplacementChunk *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replacement, a3);
    v13->_originalRange.NSUInteger location = location;
    v13->_originalRange.NSUInteger length = length;
    objc_storeStrong((id *)&v13->_uuid, a5);
    uint64_t v14 = [v10 length];
    int64_t v15 = v13->_originalRange.length + v13->_originalRange.location;
    v13->_lengthDelta = v14 - length;
    v13->_originalEndIndex = v15;
  }

  return v13;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWritingToolsReplacementChunk;
  v3 = [(_UIWritingToolsReplacementChunk *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" range={%lu, %lu} delta=%ld end=%lu uuid=%p replacement=%@", self->_originalRange.location, self->_originalRange.length, self->_lengthDelta, self->_originalEndIndex, self->_uuid, self->_replacement];

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (_NSRange)originalRange
{
  NSUInteger length = self->_originalRange.length;
  NSUInteger location = self->_originalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSAttributedString)replacement
{
  return self->_replacement;
}

- (int64_t)lengthDelta
{
  return self->_lengthDelta;
}

- (int64_t)originalEndIndex
{
  return self->_originalEndIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end