@interface VKInternedString
+ (id)stringWithString:(id)a3;
+ (void)initialize;
- (BOOL)isEqualToString:(id)a3;
- (VKInternedString)initWithString:(id)a3;
- (id)substringFromIndex:(unint64_t)a3;
- (id)substringToIndex:(unint64_t)a3;
- (id)substringWithRange:(_NSRange)a3;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6;
- (unint64_t)hash;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation VKInternedString

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [(NSString *)self->original hash];
}

- (BOOL)isEqualToString:(id)a3
{
  return [(NSString *)self->original isEqualToString:a3];
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  return -[NSString compare:options:range:locale:](self->original, "compare:options:range:locale:", a3, a4, a5.location, a5.length, a6);
}

- (id)substringWithRange:(_NSRange)a3
{
  return -[NSString substringWithRange:](self->original, "substringWithRange:", a3.location, a3.length);
}

- (id)substringToIndex:(unint64_t)a3
{
  return [(NSString *)self->original substringToIndex:a3];
}

- (id)substringFromIndex:(unint64_t)a3
{
  return [(NSString *)self->original substringFromIndex:a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->original characterAtIndex:a3];
}

- (unint64_t)length
{
  return [(NSString *)self->original length];
}

- (void)dealloc
{
  [(id)_lock lock];
  [(id)_strings removeObject:self];
  [(id)_lock unlock];
  v3.receiver = self;
  v3.super_class = (Class)VKInternedString;
  [(VKInternedString *)&v3 dealloc];
}

- (VKInternedString)initWithString:(id)a3
{
  return self;
}

+ (id)stringWithString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (VKInternedString *)v3;
  }
  else
  {
    [(id)_lock lock];
    v4 = [(id)_strings member:v3];
    if (!v4)
    {
      v4 = [[VKInternedString alloc] initWithString:v3];
      objc_msgSend((id)_strings, "addObject:");
    }
    [(id)_lock unlock];
  }

  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "_vk_newWeakSet");
    id v3 = (void *)_strings;
    _strings = v2;

    id v4 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    v5 = (void *)_lock;
    _lock = (uint64_t)v4;
  }
}

@end