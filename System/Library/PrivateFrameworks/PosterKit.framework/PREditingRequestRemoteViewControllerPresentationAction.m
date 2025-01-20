@interface PREditingRequestRemoteViewControllerPresentationAction
- (CGRect)presentedViewScreenRect;
- (PREditingRequestRemoteViewControllerPresentationAction)initWithSourceLayerRenderId:(unint64_t)a3 sourceContextId:(unsigned int)a4 presentedViewScreenRect:(CGRect)a5;
- (unint64_t)sourceLayerRenderId;
- (unsigned)sourceContextId;
@end

@implementation PREditingRequestRemoteViewControllerPresentationAction

- (PREditingRequestRemoteViewControllerPresentationAction)initWithSourceLayerRenderId:(unint64_t)a3 sourceContextId:(unsigned int)a4 presentedViewScreenRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v9 = *(void *)&a4;
  id v12 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v13 = [NSNumber numberWithUnsignedLongLong:a3];
  [v12 setObject:v13 forSetting:1];

  v14 = [NSNumber numberWithUnsignedInt:v9];
  [v12 setObject:v14 forSetting:2];

  *(CGFloat *)v19 = x;
  *(CGFloat *)&v19[1] = y;
  *(CGFloat *)&v19[2] = width;
  *(CGFloat *)&v19[3] = height;
  v15 = [MEMORY[0x1E4F29238] valueWithBytes:v19 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v12 setObject:v15 forSetting:3];

  v18.receiver = self;
  v18.super_class = (Class)PREditingRequestRemoteViewControllerPresentationAction;
  v16 = [(PREditingRequestRemoteViewControllerPresentationAction *)&v18 initWithInfo:v12 responder:0];

  return v16;
}

- (unint64_t)sourceLayerRenderId
{
  v2 = [(PREditingRequestRemoteViewControllerPresentationAction *)self info];
  v3 = [v2 objectForSetting:1];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unsigned)sourceContextId
{
  v2 = [(PREditingRequestRemoteViewControllerPresentationAction *)self info];
  v3 = [v2 objectForSetting:2];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (CGRect)presentedViewScreenRect
{
  v2 = [(PREditingRequestRemoteViewControllerPresentationAction *)self info];
  v3 = [v2 objectForSetting:3];
  objc_msgSend(v3, "bs_CGRectValue");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

@end