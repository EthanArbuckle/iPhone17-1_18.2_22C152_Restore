@interface _TUIFeedCaptureImageResource
- (BOOL)intrinsic;
- (BOOL)isEqual:(id)a3;
- (CGSize)naturalSize;
- (NSObject)instance;
- (NSObject)options;
- (NSString)kind;
- (TUIImageResource)resource;
- (_TUIFeedCaptureImageResource)initWithResource:(id)a3 kind:(id)a4 instance:(id)a5 options:(id)a6;
- (_TUIFeedCaptureImageResource)initWithResource:(id)a3 kind:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6 instance:(id)a7 options:(id)a8;
- (double)contentsScale;
- (unint64_t)hash;
@end

@implementation _TUIFeedCaptureImageResource

- (_TUIFeedCaptureImageResource)initWithResource:(id)a3 kind:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6 instance:(id)a7 options:(id)a8
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_TUIFeedCaptureImageResource;
  v20 = [(_TUIFeedCaptureImageResource *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_resource, a3);
    objc_storeStrong((id *)&v21->_kind, a4);
    v21->_naturalSize.CGFloat width = width;
    v21->_naturalSize.CGFloat height = height;
    v21->_contentsScale = a6;
    objc_storeStrong((id *)&v21->_instance, a7);
    objc_storeStrong((id *)&v21->_options, a8);
    v21->_intrinsic = 0;
  }

  return v21;
}

- (_TUIFeedCaptureImageResource)initWithResource:(id)a3 kind:(id)a4 instance:(id)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_TUIFeedCaptureImageResource;
  v15 = [(_TUIFeedCaptureImageResource *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_resource, a3);
    objc_storeStrong((id *)&v16->_kind, a4);
    v16->_naturalSize = CGSizeZero;
    v16->_contentsScale = 1.0;
    objc_storeStrong((id *)&v16->_instance, a5);
    objc_storeStrong((id *)&v16->_options, a6);
    v16->_intrinsic = 1;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  if (v6
    && ((kind = self->_kind, kind == (NSString *)v6[3]) || -[NSString isEqualToString:](kind, "isEqualToString:"))
    && ((instance = self->_instance, instance == v6[5])
     || -[NSObject isEqual:](instance, "isEqual:")))
  {
    options = self->_options;
    if (options == v6[6]) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = -[NSObject isEqual:](options, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_kind hash];
  unint64_t v4 = (unint64_t)[self->_instance hash] ^ v3;
  return v4 ^ (unint64_t)[self->_options hash];
}

- (TUIImageResource)resource
{
  return self->_resource;
}

- (NSString)kind
{
  return self->_kind;
}

- (CGSize)naturalSize
{
  double width = self->_naturalSize.width;
  double height = self->_naturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)options
{
  return self->_options;
}

- (BOOL)intrinsic
{
  return self->_intrinsic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_resource, 0);
}

@end