@interface _UIHostedWindowHostingHandle
+ (BOOL)supportsSecureCoding;
+ (_UIHostedWindowHostingHandle)hostedWindowHostingHandleWithContextID:(unsigned int)a3 rootLayerTransform:(CGAffineTransform *)a4 rootLayerFrame:(CGRect)a5;
- (CGAffineTransform)rootLayerTransform;
- (CGRect)rootLayerFrame;
- (_UIHostedWindowHostingHandle)initWithCoder:(id)a3;
- (int)pid;
- (unsigned)contextID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHostedWindowHostingHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid = self->_pid;
  id v5 = a3;
  [v5 encodeInt32:pid forKey:@"pid"];
  [v5 encodeInt32:self->_contextID forKey:@"contextID"];
  long long v6 = *(_OWORD *)&self->_rootLayerTransform.c;
  v7[0] = *(_OWORD *)&self->_rootLayerTransform.a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_rootLayerTransform.tx;
  [v5 encodeCGAffineTransform:v7 forKey:@"rootLayerTransform"];
  objc_msgSend(v5, "encodeCGRect:forKey:", @"rootLayerFrame", self->_rootLayerFrame.origin.x, self->_rootLayerFrame.origin.y, self->_rootLayerFrame.size.width, self->_rootLayerFrame.size.height);
}

- (_UIHostedWindowHostingHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIHostedWindowHostingHandle;
  id v5 = [(_UIHostedWindowHostingHandle *)&v15 init];
  if (v5)
  {
    v5->_uint64_t pid = [v4 decodeInt32ForKey:@"pid"];
    v5->_contextID = [v4 decodeInt32ForKey:@"contextID"];
    if (v4)
    {
      [v4 decodeCGAffineTransformForKey:@"rootLayerTransform"];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v12 = 0u;
    }
    *(_OWORD *)&v5->_rootLayerTransform.a = v12;
    *(_OWORD *)&v5->_rootLayerTransform.c = v13;
    *(_OWORD *)&v5->_rootLayerTransform.tx = v14;
    objc_msgSend(v4, "decodeCGRectForKey:", @"rootLayerFrame", v12, v13, v14);
    v5->_rootLayerFrame.origin.x = v6;
    v5->_rootLayerFrame.origin.y = v7;
    v5->_rootLayerFrame.size.width = v8;
    v5->_rootLayerFrame.size.height = v9;
    v10 = v5;
  }

  return v5;
}

+ (_UIHostedWindowHostingHandle)hostedWindowHostingHandleWithContextID:(unsigned int)a3 rootLayerTransform:(CGAffineTransform *)a4 rootLayerFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v11 = objc_alloc_init(_UIHostedWindowHostingHandle);
  v11->_uint64_t pid = getpid();
  v11->_contextID = a3;
  long long v13 = *(_OWORD *)&a4->c;
  long long v12 = *(_OWORD *)&a4->tx;
  *(_OWORD *)&v11->_rootLayerTransform.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v11->_rootLayerTransform.c = v13;
  *(_OWORD *)&v11->_rootLayerTransform.tCGFloat x = v12;
  v11->_rootLayerFrame.origin.CGFloat x = x;
  v11->_rootLayerFrame.origin.CGFloat y = y;
  v11->_rootLayerFrame.size.CGFloat width = width;
  v11->_rootLayerFrame.size.CGFloat height = height;
  return v11;
}

- (int)pid
{
  return self->_pid;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (CGAffineTransform)rootLayerTransform
{
  long long v3 = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[1].a;
  return self;
}

- (CGRect)rootLayerFrame
{
  double x = self->_rootLayerFrame.origin.x;
  double y = self->_rootLayerFrame.origin.y;
  double width = self->_rootLayerFrame.size.width;
  double height = self->_rootLayerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end