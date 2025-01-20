@interface TUIHyperlinkTextFragment
- (NSArray)fragments;
- (NSURL)url;
- (TUIHyperlinkTextFragment)initWithURL:(id)a3 fragments:(id)a4;
- (void)appendToBuilder:(id)a3 context:(id)a4;
@end

@implementation TUIHyperlinkTextFragment

- (TUIHyperlinkTextFragment)initWithURL:(id)a3 fragments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIHyperlinkTextFragment;
  v8 = [(TUIHyperlinkTextFragment *)&v14 init];
  if (v8)
  {
    v9 = (NSURL *)[v6 copy];
    url = v8->_url;
    v8->_url = v9;

    v11 = (NSArray *)[v7 copy];
    fragments = v8->_fragments;
    v8->_fragments = v11;
  }
  return v8;
}

- (void)appendToBuilder:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  url = self->_url;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5E724;
  v11[3] = &unk_252320;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v10 appendHyperlinkWithURL:url block:v11];
}

- (NSURL)url
{
  return self->_url;
}

- (NSArray)fragments
{
  return self->_fragments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end