@interface _UIWTCTextEffectContainerInfo
+ (id)effectContainerInfoWithLookupID:(id)a3 initialRange:(_NSRange)a4;
- (BOOL)isEqual:(id)a3;
- (NSUUID)lookupID;
- (_NSRange)initialRange;
- (_NSRange)resultRange;
- (_UIWTCTextEffectContainerInfo)initWithLookupID:(id)a3 initialRange:(_NSRange)a4;
- (id)description;
- (unint64_t)hash;
- (void)setResultRange:(_NSRange)a3;
@end

@implementation _UIWTCTextEffectContainerInfo

- (_UIWTCTextEffectContainerInfo)initWithLookupID:(id)a3 initialRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIWTCTextEffectContainerInfo;
  v9 = [(_UIWTCTextEffectContainerInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lookupID, a3);
    v10->_initialRange.NSUInteger location = location;
    v10->_initialRange.NSUInteger length = length;
  }

  return v10;
}

+ (id)effectContainerInfoWithLookupID:(id)a3 initialRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)a1), "initWithLookupID:initialRange:", v7, location, length);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIWTCTextEffectContainerInfo;
  if ([(_UIWTCTextEffectContainerInfo *)&v12 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      lookupID = self->_lookupID;
      id v8 = [v6 lookupID];
      if ([(NSUUID *)lookupID isEqual:v8]) {
        BOOL v5 = self->_initialRange.location == [v6 initialRange] && self->_initialRange.length == v9;
      }
      else {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_lookupID hash];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWTCTextEffectContainerInfo;
  v3 = [(_UIWTCTextEffectContainerInfo *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" lookupID=%@ initialRange={%lu, %lu} resultRange={%lu, %lu}", self->_lookupID, self->_initialRange.location, self->_initialRange.length, self->_resultRange.location, self->_resultRange.length];

  return v4;
}

- (NSUUID)lookupID
{
  return self->_lookupID;
}

- (_NSRange)initialRange
{
  NSUInteger length = self->_initialRange.length;
  NSUInteger location = self->_initialRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)resultRange
{
  NSUInteger length = self->_resultRange.length;
  NSUInteger location = self->_resultRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setResultRange:(_NSRange)a3
{
  self->_resultRange = a3;
}

- (void).cxx_destruct
{
}

@end