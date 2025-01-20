@interface TUIAttributeSet
+ (id)allSupportedAttributes;
+ (id)globallySupportedAttributes;
+ (id)set;
+ (id)setWithArray:(id)a3;
+ (id)supportedAttributesSize;
+ (id)supportedAttributesSizeAndIntrinsic;
+ (id)supportedAttributesStyling;
+ (id)supportedAttributesTextStyling;
- (BOOL)containsAttribute:(unsigned __int16)a3;
- (TUIAttributeSet)initWithArray:(id)a3;
- (TUIAttributeSet)initWithOther:(id)a3;
- (TUIAttributeSet)initWithSet:(id)a3;
- (const)_bitset;
- (id).cxx_construct;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)setByAddingAttributesFromArray:(id)a3;
- (id)setByAddingAttributesFromSet:(id)a3;
- (unint64_t)count;
@end

@implementation TUIAttributeSet

+ (id)set
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)setWithArray:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithArray:v4];

  return v5;
}

- (TUIAttributeSet)initWithArray:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIAttributeSet;
  id v5 = [(TUIAttributeSet *)&v16 init];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned int v10 = +[TUIAttributeRegistry attributeWithName:](TUIAttributeRegistry, "attributeWithName:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10 >= 0x100) {
            sub_8CCD0("bitset set argument out of range");
          }
          *(unint64_t *)((char *)v5->_bitset.__first_ + (((unint64_t)v10 >> 3) & 0x1FF8)) |= 1 << v10;
        }
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (TUIAttributeSet)initWithSet:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIAttributeSet;
  id v5 = [(TUIAttributeSet *)&v16 init];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned int v10 = +[TUIAttributeRegistry attributeWithName:](TUIAttributeRegistry, "attributeWithName:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10 >= 0x100) {
            sub_8CCD0("bitset set argument out of range");
          }
          *(unint64_t *)((char *)v5->_bitset.__first_ + (((unint64_t)v10 >> 3) & 0x1FF8)) |= 1 << v10;
        }
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (TUIAttributeSet)initWithOther:(id)a3
{
  id v4 = (char *)a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIAttributeSet;
  id v5 = [(TUIAttributeSet *)&v9 init];
  id v6 = (TUIAttributeSet *)v5;
  if (v4 && v5)
  {
    long long v7 = *(_OWORD *)(v4 + 8);
    *(_OWORD *)(v5 + 24) = *(_OWORD *)(v4 + 24);
    *(_OWORD *)(v5 + 8) = v7;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TUIMutableAttributeSet allocWithZone:a3];

  return [(TUIAttributeSet *)v4 initWithOther:self];
}

- (const)_bitset
{
  return &self->_bitset;
}

- (BOOL)containsAttribute:(unsigned __int16)a3
{
  if (a3 == 0xFFFF)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    if (a3 >= 0x100u) {
      sub_8CCD0("bitset test argument out of range");
    }
    return (*(unint64_t *)((char *)self->_bitset.__first_ + (((unint64_t)a3 >> 3) & 0x1FF8)) >> a3) & 1;
  }
  return v3;
}

- (unint64_t)count
{
  char v3 = 1;
  return sub_174F34((int8x8_t *)&self->_bitset, 0, (uint64_t)&self[1], 0, &v3);
}

- (id)setByAddingAttributesFromSet:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIAttributeSet *)self mutableCopy];
  [v5 unionSet:v4];

  return v5;
}

- (id)setByAddingAttributesFromArray:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIAttributeSet *)self mutableCopy];
  id v6 = +[TUIAttributeSet setWithArray:v4];
  [v5 unionSet:v6];

  return v5;
}

+ (id)allSupportedAttributes
{
  if (qword_2DFA20 != -1) {
    dispatch_once(&qword_2DFA20, &stru_257080);
  }
  id v2 = (void *)qword_2DFA18;

  return v2;
}

+ (id)globallySupportedAttributes
{
  if (qword_2DFA30 != -1) {
    dispatch_once(&qword_2DFA30, &stru_2570A0);
  }
  id v2 = (void *)qword_2DFA28;

  return v2;
}

+ (id)supportedAttributesStyling
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_174180;
  block[3] = &unk_252C50;
  block[4] = a1;
  if (qword_2DFA40 != -1) {
    dispatch_once(&qword_2DFA40, block);
  }
  id v2 = (void *)qword_2DFA38;

  return v2;
}

+ (id)supportedAttributesTextStyling
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_174680;
  block[3] = &unk_252C50;
  block[4] = a1;
  if (qword_2DFA50 != -1) {
    dispatch_once(&qword_2DFA50, block);
  }
  id v2 = (void *)qword_2DFA48;

  return v2;
}

+ (id)supportedAttributesSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_174844;
  block[3] = &unk_252C50;
  block[4] = a1;
  if (qword_2DFA60 != -1) {
    dispatch_once(&qword_2DFA60, block);
  }
  id v2 = (void *)qword_2DFA58;

  return v2;
}

+ (id)supportedAttributesSizeAndIntrinsic
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_174AC0;
  block[3] = &unk_252C50;
  block[4] = a1;
  if (qword_2DFA70 != -1) {
    dispatch_once(&qword_2DFA70, block);
  }
  id v2 = (void *)qword_2DFA68;

  return v2;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end