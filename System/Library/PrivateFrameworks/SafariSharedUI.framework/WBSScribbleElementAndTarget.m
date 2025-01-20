@interface WBSScribbleElementAndTarget
- (WBSScribbleElement)element;
- (WBSScribbleElementAndTarget)initWithElement:(id)a3 target:(id)a4;
- (_WKTargetedElementInfo)target;
@end

@implementation WBSScribbleElementAndTarget

- (WBSScribbleElementAndTarget)initWithElement:(id)a3 target:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSScribbleElementAndTarget;
  v9 = [(WBSScribbleElementAndTarget *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_element, a3);
    objc_storeStrong((id *)&v10->_target, a4);
    v11 = v10;
  }

  return v10;
}

- (WBSScribbleElement)element
{
  return self->_element;
}

- (_WKTargetedElementInfo)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end