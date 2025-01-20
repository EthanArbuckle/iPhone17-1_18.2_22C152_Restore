@interface RTIDocumentRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RTIDocumentRequest)init;
- (RTIDocumentRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)flags;
- (int64_t)rectCountAfter;
- (int64_t)rectCountBefore;
- (int64_t)rectGranularity;
- (int64_t)surroundingGranularityCount;
- (int64_t)textGranularity;
- (void)encodeWithCoder:(id)a3;
- (void)setFlags:(int64_t)a3;
- (void)setRectCountAfter:(int64_t)a3;
- (void)setRectCountBefore:(int64_t)a3;
- (void)setRectGranularity:(int64_t)a3;
- (void)setSurroundingGranularityCount:(int64_t)a3;
- (void)setTextGranularity:(int64_t)a3;
@end

@implementation RTIDocumentRequest

- (RTIDocumentRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTIDocumentRequest;
  result = [(RTIDocumentRequest *)&v3 init];
  if (result)
  {
    result->_rectCountBefore = -1;
    result->_rectCountAfter = -1;
  }
  return result;
}

- (void)setTextGranularity:(int64_t)a3
{
  self->_textGranularity = a3;
  if (!self->_didSetRectGranularity) {
    self->_rectGranularity = a3;
  }
}

- (void)setRectGranularity:(int64_t)a3
{
  self->_rectGranularity = a3;
  self->_didSetRectGranularity = 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeInt64:self->_flags forKey:@"reqF"];
  [v4 encodeInt32:LODWORD(self->_textGranularity) forKey:@"reqG"];
  [v4 encodeInt32:LODWORD(self->_rectGranularity) forKey:@"rectG"];
  [v4 encodeInt32:LODWORD(self->_surroundingGranularityCount) forKey:@"reqSC"];
  [v4 encodeInt32:LODWORD(self->_rectCountBefore) forKey:@"reqRCB"];
  [v4 encodeInt32:LODWORD(self->_rectCountAfter) forKey:@"reqRCA"];
}

- (RTIDocumentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v9.receiver = self;
  v9.super_class = (Class)RTIDocumentRequest;
  v5 = [(RTIDocumentRequest *)&v9 init];
  if (v5)
  {
    v5->_flags = [v4 decodeInt64ForKey:@"reqF"];
    v5->_textGranularity = (int)[v4 decodeInt32ForKey:@"reqG"];
    v5->_rectGranularity = (int)[v4 decodeInt32ForKey:@"rectG"];
    v5->_surroundingGranularityCount = (int)[v4 decodeInt32ForKey:@"reqSC"];
    if ([v4 containsValueForKey:@"reqRCB"]) {
      uint64_t v6 = (int)[v4 decodeInt32ForKey:@"reqRCB"];
    }
    else {
      uint64_t v6 = -1;
    }
    v5->_rectCountBefore = v6;
    if ([v4 containsValueForKey:@"reqRCA"]) {
      uint64_t v7 = (int)[v4 decodeInt32ForKey:@"reqRCA"];
    }
    else {
      uint64_t v7 = -1;
    }
    v5->_rectCountAfter = v7;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[RTIDocumentRequest allocWithZone:a3] init];
  *((void *)result + 2) = self->_flags;
  *((void *)result + 3) = self->_textGranularity;
  *((void *)result + 4) = self->_rectGranularity;
  *((void *)result + 5) = self->_surroundingGranularityCount;
  *((void *)result + 6) = self->_rectCountBefore;
  *((void *)result + 7) = self->_rectCountAfter;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTIDocumentRequest *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(RTIDocumentRequest *)self flags];
      if (v6 == [(RTIDocumentRequest *)v5 flags]
        && (int64_t v7 = [(RTIDocumentRequest *)self textGranularity],
            v7 == [(RTIDocumentRequest *)v5 textGranularity])
        && (int64_t v8 = [(RTIDocumentRequest *)self rectGranularity],
            v8 == [(RTIDocumentRequest *)v5 rectGranularity])
        && (int64_t v9 = [(RTIDocumentRequest *)self surroundingGranularityCount],
            v9 == [(RTIDocumentRequest *)v5 surroundingGranularityCount])
        && (int64_t v10 = [(RTIDocumentRequest *)self rectCountBefore],
            v10 == [(RTIDocumentRequest *)v5 rectCountBefore]))
      {
        int64_t v11 = [(RTIDocumentRequest *)self rectCountAfter];
        BOOL v12 = v11 == [(RTIDocumentRequest *)v5 rectCountAfter];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; flags = %ld", -[RTIDocumentRequest flags](self, "flags"));
  objc_msgSend(v3, "appendFormat:", @"; textGranularity = %ld",
    [(RTIDocumentRequest *)self textGranularity]);
  objc_msgSend(v3, "appendFormat:", @"; rectGranularity = %ld",
    [(RTIDocumentRequest *)self rectGranularity]);
  objc_msgSend(v3, "appendFormat:", @"; surroundingGranularityCount = %ld",
    [(RTIDocumentRequest *)self surroundingGranularityCount]);
  objc_msgSend(v3, "appendFormat:", @"; rectCountBefore = %ld",
    [(RTIDocumentRequest *)self rectCountBefore]);
  objc_msgSend(v3, "appendFormat:", @"; rectCountAfter = %ld",
    [(RTIDocumentRequest *)self rectCountAfter]);
  return v3;
}

- (int64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(int64_t)a3
{
  self->_flags = a3;
}

- (int64_t)textGranularity
{
  return self->_textGranularity;
}

- (int64_t)rectGranularity
{
  return self->_rectGranularity;
}

- (int64_t)surroundingGranularityCount
{
  return self->_surroundingGranularityCount;
}

- (void)setSurroundingGranularityCount:(int64_t)a3
{
  self->_surroundingGranularityCount = a3;
}

- (int64_t)rectCountBefore
{
  return self->_rectCountBefore;
}

- (void)setRectCountBefore:(int64_t)a3
{
  self->_rectCountBefore = a3;
}

- (int64_t)rectCountAfter
{
  return self->_rectCountAfter;
}

- (void)setRectCountAfter:(int64_t)a3
{
  self->_rectCountAfter = a3;
}

@end