@interface MRTextEditingAttributes
- (MRTextEditingAttributes)initWithTitle:(id)a3 prompt:(id)a4;
- (NSString)prompt;
- (NSString)title;
- (_MRTextInputTraits)inputTraits;
- (char)_copyWithZone:(objc_class *)a3 usingConcreteClass:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation MRTextEditingAttributes

- (MRTextEditingAttributes)initWithTitle:(id)a3 prompt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRTextEditingAttributes;
  v8 = [(MRTextEditingAttributes *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    prompt = v8->_prompt;
    v8->_prompt = (NSString *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)v5;
  if (self->_inputTraits.secureTextEntry) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"<%@ %p \"%@\" secure=%@>", v5, self, self->_title, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  return -[MRTextEditingAttributes _copyWithZone:usingConcreteClass:]((uint64_t)self, v4, v5);
}

- (char)_copyWithZone:(objc_class *)a3 usingConcreteClass:
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (char *)objc_alloc_init(a3);
  uint64_t v5 = [*(id *)(a1 + 8) copy];
  id v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  uint64_t v7 = [*(id *)(a1 + 16) copy];
  v8 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v7;

  *(_OWORD *)(v4 + 24) = *(_OWORD *)(a1 + 24);
  long long v9 = *(_OWORD *)(a1 + 40);
  long long v10 = *(_OWORD *)(a1 + 56);
  long long v11 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(v4 + 88) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v4 + 72) = v11;
  *(_OWORD *)(v4 + 56) = v10;
  *(_OWORD *)(v4 + 40) = v9;
  long long v12 = *(_OWORD *)(a1 + 104);
  long long v13 = *(_OWORD *)(a1 + 120);
  long long v14 = *(_OWORD *)(a1 + 136);
  *((void *)v4 + 19) = *(void *)(a1 + 152);
  *(_OWORD *)(v4 + 136) = v14;
  *(_OWORD *)(v4 + 120) = v13;
  *(_OWORD *)(v4 + 104) = v12;
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  return -[MRTextEditingAttributes _copyWithZone:usingConcreteClass:]((uint64_t)self, v4, v5);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (_MRTextInputTraits)inputTraits
{
  long long v3 = *(_OWORD *)&self->PINEntrySeparatorIndexes[7];
  long long v4 = *(_OWORD *)&self[1].autocapitalizationType;
  *(_OWORD *)&retstr->PINEntrySeparatorIndexes[6] = *(_OWORD *)&self->PINEntrySeparatorIndexes[9];
  *(_OWORD *)&retstr->PINEntrySeparatorIndexes[8] = v4;
  retstr->PINEntrySeparatorIndexesCount = *(void *)&self[1].returnKeyType;
  long long v5 = *(_OWORD *)&self->enablesReturnKeyAutomatically;
  long long v6 = *(_OWORD *)&self->PINEntrySeparatorIndexes[3];
  *(_OWORD *)&retstr->validTextRange.length = *(_OWORD *)&self->PINEntrySeparatorIndexes[1];
  *(_OWORD *)retstr->PINEntrySeparatorIndexes = v6;
  *(_OWORD *)&retstr->PINEntrySeparatorIndexes[2] = *(_OWORD *)&self->PINEntrySeparatorIndexes[5];
  *(_OWORD *)&retstr->PINEntrySeparatorIndexes[4] = v3;
  *($5CFEE62CA76FAE445C6F9DBCEE669C70 *)&retstr->autocapitalizationType = self->validTextRange;
  *(_OWORD *)&retstr->returnKeyType = v5;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end