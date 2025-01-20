@interface PPSocialHighlightStaticFeatureProvider
- (id)valueForHighlight:(id)a3;
- (void)initWithComputedFeatures:(void *)a3 highlightKeyBlock:;
@end

@implementation PPSocialHighlightStaticFeatureProvider

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyBlock, 0);
  objc_storeStrong((id *)&self->_computedFeatures, 0);
}

- (void)initWithComputedFeatures:(void *)a3 highlightKeyBlock:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PPSocialHighlightStaticFeatureProvider;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 1, a2);
      uint64_t v9 = [v7 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (id)valueForHighlight:(id)a3
{
  v4 = (*((void (**)(void))self->_keyBlock + 2))();
  if (v4)
  {
    v5 = [(NSDictionary *)self->_computedFeatures objectForKeyedSubscript:v4];
  }
  else
  {
    v5 = &unk_1F256B250;
  }

  return v5;
}

@end