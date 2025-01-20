@interface BTVCBonjourBrowserResultChanges
- (BTVCBonjourBrowserResultChanges)initWithOldResult:(id)a3 freshResult:(id)a4 change:(unint64_t)a5;
- (OS_nw_browse_result)freshResult;
- (OS_nw_browse_result)oldResult;
- (unint64_t)change;
@end

@implementation BTVCBonjourBrowserResultChanges

- (BTVCBonjourBrowserResultChanges)initWithOldResult:(id)a3 freshResult:(id)a4 change:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BTVCBonjourBrowserResultChanges;
  v11 = [(BTVCBonjourBrowserResultChanges *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_oldResult, a3);
    objc_storeStrong((id *)&v12->_freshResult, a4);
    v12->_change = a5;
  }

  return v12;
}

- (OS_nw_browse_result)oldResult
{
  return self->_oldResult;
}

- (OS_nw_browse_result)freshResult
{
  return self->_freshResult;
}

- (unint64_t)change
{
  return self->_change;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freshResult, 0);

  objc_storeStrong((id *)&self->_oldResult, 0);
}

@end