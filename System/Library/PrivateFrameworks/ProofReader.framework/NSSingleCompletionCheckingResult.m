@interface NSSingleCompletionCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isPromoted;
- (BOOL)isSingleCompletion;
- (NSIndexSet)completeWordIndexes;
- (NSSingleCompletionCheckingResult)initWithCoder:(id)a3;
- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 completeWordIndexes:(id)a5;
- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 completeWordIndexes:(id)a5 isPromoted:(BOOL)a6;
- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 stopCompletingIndex:(unint64_t)a5;
- (id)description;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (unint64_t)stopCompletingIndex;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSingleCompletionCheckingResult

- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 completeWordIndexes:(id)a5 isPromoted:(BOOL)a6
{
  v10.receiver = self;
  v10.super_class = (Class)NSSingleCompletionCheckingResult;
  v8 = -[NSSubstitutionCheckingResult initWithRange:replacementString:](&v10, sel_initWithRange_replacementString_, a3.location, a3.length, a4);
  if (v8)
  {
    v8->_completeWordIndexes = (NSIndexSet *)[a5 copy];
    v8->_isPromoted = a6;
  }
  return v8;
}

- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 completeWordIndexes:(id)a5
{
  return -[NSSingleCompletionCheckingResult initWithRange:replacementString:completeWordIndexes:isPromoted:](self, "initWithRange:replacementString:completeWordIndexes:isPromoted:", a3.location, a3.length, a4, a5, 0);
}

- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 stopCompletingIndex:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = [MEMORY[0x263F088D0] indexSetWithIndex:a5];
  }
  return -[NSSingleCompletionCheckingResult initWithRange:replacementString:completeWordIndexes:](self, "initWithRange:replacementString:completeWordIndexes:", location, length, a4, v9);
}

- (void)dealloc
{
  completeWordIndexes = self->_completeWordIndexes;
  if (completeWordIndexes)
  {

    self->_completeWordIndexes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSSingleCompletionCheckingResult;
  [(NSSubstitutionCheckingResult *)&v4 dealloc];
}

- (unint64_t)stopCompletingIndex
{
  if ([(NSSingleCompletionCheckingResult *)self completeWordIndexes])
  {
    v3 = [(NSSingleCompletionCheckingResult *)self completeWordIndexes];
    return [(NSIndexSet *)v3 firstIndex];
  }
  else
  {
    id v5 = [(NSSubstitutionCheckingResult *)self replacementString];
    return [v5 length];
  }
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)NSSingleCompletionCheckingResult;
  id v4 = [(NSSubstitutionCheckingResult *)&v9 description];
  unint64_t v5 = [(NSSingleCompletionCheckingResult *)self stopCompletingIndex];
  BOOL v6 = [(NSSingleCompletionCheckingResult *)self isPromoted];
  v7 = &stru_26C1C71A8;
  if (v6) {
    v7 = @"+";
  }
  return (id)[v3 stringWithFormat:@"%@/%u%@", v4, v5, v7];
}

- (unint64_t)resultType
{
  return 0x20000000;
}

- (BOOL)isSingleCompletion
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSingleCompletionCheckingResult;
  -[NSSubstitutionCheckingResult encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeObject:forKey:", -[NSSingleCompletionCheckingResult completeWordIndexes](self, "completeWordIndexes"), @"NSCompleteWordIndexes");
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSSingleCompletionCheckingResult stopCompletingIndex](self, "stopCompletingIndex"), @"NSStopCompletingIndex");
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[NSSingleCompletionCheckingResult isPromoted](self, "isPromoted")), @"NSIsPromoted");
  }
}

- (NSSingleCompletionCheckingResult)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NSSingleCompletionCheckingResult;
  id v4 = -[NSSubstitutionCheckingResult initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      objc_super v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSCompleteWordIndexes"];
      if (!v5)
      {
        uint64_t v9 = [a3 decodeIntegerForKey:@"NSStopCompletingIndex"];
        if (v9)
        {
          if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
            objc_super v5 = (void *)[MEMORY[0x263F088D0] indexSetWithIndex:v9];
          }
        }
      }
      BOOL v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSIsPromoted"];
    }
    else
    {
      objc_super v5 = 0;
      BOOL v6 = 0;
    }
    v4->_completeWordIndexes = (NSIndexSet *)[v5 copy];
    if (v6) {
      char v7 = [v6 BOOLValue];
    }
    else {
      char v7 = 0;
    }
    v4->_isPromoted = v7;
  }
  return v4;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  v5.NSUInteger location = [(NSSubstitutionCheckingResult *)self range];
  NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v5.location < -a3)
    {
      uint64_t v9 = (void *)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0], objc_msgSend(NSString, "stringWithFormat:", @"%ld invalid offset for range %@", a3, NSStringFromRange(v5)), 0 reason userInfo];
      objc_exception_throw(v9);
    }
    NSUInteger v6 = v5.location + a3;
  }
  char v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:replacementString:completeWordIndexes:isPromoted:", v6, v5.length, -[NSSubstitutionCheckingResult replacementString](self, "replacementString"), -[NSSingleCompletionCheckingResult completeWordIndexes](self, "completeWordIndexes"), -[NSSingleCompletionCheckingResult isPromoted](self, "isPromoted"));
  return v7;
}

- (NSIndexSet)completeWordIndexes
{
  return (NSIndexSet *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isPromoted
{
  return self->_isPromoted;
}

@end