@interface MusicSettingsDynamicFooterHyperlinkAction
- (MusicSettingsDynamicFooterHyperlinkAction)initWithTarget:(id)a3 selectorString:(id)a4;
- (NSString)selectorString;
- (id)target;
@end

@implementation MusicSettingsDynamicFooterHyperlinkAction

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_selectorString, 0);
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (NSString)selectorString
{
  return self->_selectorString;
}

- (MusicSettingsDynamicFooterHyperlinkAction)initWithTarget:(id)a3 selectorString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MusicSettingsDynamicFooterHyperlinkAction;
  v8 = [(MusicSettingsDynamicFooterHyperlinkAction *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_target, v6);
    uint64_t v10 = [v7 copy];
    selectorString = v9->_selectorString;
    v9->_selectorString = (NSString *)v10;
  }
  return v9;
}

@end