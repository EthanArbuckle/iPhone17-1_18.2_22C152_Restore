@interface _TUIFeedCaptureSection
- (NSMutableArray)dynamicStates;
- (NSMutableArray)imageResources;
- (TUIBindings)bindings;
- (TUIFeedEntry)entry;
- (TUITemplate)aTemplate;
- (_TUIFeedCaptureSection)initWithEntry:(id)a3 bindings:(id)a4 template:(id)a5;
- (id)dictionaryRepresentation;
- (void)captureDynamicState:(id)a3 forKind:(id)a4 instance:(id)a5 parameters:(id)a6;
- (void)captureImageResource:(id)a3 forKind:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6 instance:(id)a7 options:(id)a8;
- (void)captureIntrinsicImageResource:(id)a3 forKind:(id)a4 instance:(id)a5 options:(id)a6;
@end

@implementation _TUIFeedCaptureSection

- (_TUIFeedCaptureSection)initWithEntry:(id)a3 bindings:(id)a4 template:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIFeedCaptureSection;
  v12 = [(_TUIFeedCaptureSection *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entry, a3);
    objc_storeStrong((id *)&v13->_bindings, a4);
    objc_storeStrong((id *)&v13->_aTemplate, a5);
    uint64_t v14 = objc_opt_new();
    dynamicStates = v13->_dynamicStates;
    v13->_dynamicStates = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    imageResources = v13->_imageResources;
    v13->_imageResources = (NSMutableArray *)v16;
  }
  return v13;
}

- (void)captureDynamicState:(id)a3 forKind:(id)a4 instance:(id)a5 parameters:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [[_TUIFeedCaptureDynamicState alloc] initWithValue:v13 kind:v12 instance:v11 parameters:v10];

  [(NSMutableArray *)self->_dynamicStates addObject:v14];
}

- (void)captureImageResource:(id)a3 forKind:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6 instance:(id)a7 options:(id)a8
{
  double height = a5.height;
  double width = a5.width;
  id v15 = a8;
  id v16 = a7;
  id v17 = a4;
  id v18 = a3;
  objc_super v19 = -[_TUIFeedCaptureImageResource initWithResource:kind:naturalSize:contentsScale:instance:options:]([_TUIFeedCaptureImageResource alloc], "initWithResource:kind:naturalSize:contentsScale:instance:options:", v18, v17, v16, v15, width, height, a6);

  [(NSMutableArray *)self->_imageResources addObject:v19];
}

- (void)captureIntrinsicImageResource:(id)a3 forKind:(id)a4 instance:(id)a5 options:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [[_TUIFeedCaptureImageResource alloc] initWithResource:v13 kind:v12 instance:v11 options:v10];

  [(NSMutableArray *)self->_imageResources addObject:v14];
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(TUIBindings *)self->_bindings data];
  v6 = sub_76660(v5, v4, 0);
  [v3 setObject:v6 forKeyedSubscript:@"bindings"];

  if ([v4 count])
  {
    v7 = [v4 allObjects];
    v8 = [v7 sortedArrayUsingSelector:"compare:"];
    [v3 setObject:v8 forKeyedSubscript:@"bindingsDynamicKeyPaths"];
  }
  id v9 = [(TUITemplate *)self->_aTemplate package];
  id v10 = [v9 url];
  id v11 = [v10 URLByDeletingLastPathComponent];
  id v12 = [v11 URLByDeletingLastPathComponent];

  id v13 = [(TUITemplate *)self->_aTemplate package];
  uint64_t v14 = [v13 url];

  id v15 = [(TUITemplate *)self->_aTemplate url];
  id v16 = sub_76784(v14, v12);
  [v3 setObject:v16 forKeyedSubscript:@"package"];

  id v17 = sub_76784(v15, v12);
  [v3 setObject:v17 forKeyedSubscript:@"template"];

  id v18 = [(TUIFeedEntry *)self->_entry stackNames];
  objc_super v19 = [v18 allObjects];
  [v3 setObject:v19 forKeyedSubscript:@"stackNames"];

  return v3;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (TUIBindings)bindings
{
  return self->_bindings;
}

- (TUITemplate)aTemplate
{
  return self->_aTemplate;
}

- (NSMutableArray)dynamicStates
{
  return self->_dynamicStates;
}

- (NSMutableArray)imageResources
{
  return self->_imageResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_dynamicStates, 0);
  objc_storeStrong((id *)&self->_aTemplate, 0);
  objc_storeStrong((id *)&self->_bindings, 0);

  objc_storeStrong((id *)&self->_entry, 0);
}

@end