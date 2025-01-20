@interface FCCurrentAudioContent
- (void)initWithRecentHeadlines:(void *)a3 featuredHeadlines:;
@end

@implementation FCCurrentAudioContent

- (void)initWithRecentHeadlines:(void *)a3 featuredHeadlines:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)FCCurrentAudioContent;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      v8 = (void *)a1[1];
      a1[1] = v7;

      uint64_t v9 = [v6 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredHeadlines, 0);
  objc_storeStrong((id *)&self->_recentHeadlines, 0);
}

@end