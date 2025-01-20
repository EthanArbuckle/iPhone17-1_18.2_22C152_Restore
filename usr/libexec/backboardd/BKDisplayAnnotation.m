@interface BKDisplayAnnotation
+ (BKDisplayAnnotation)annotationWithEllipseSize:(CGSize)a3;
+ (BKDisplayAnnotation)annotationWithRectangleSize:(CGSize)a3;
+ (BKDisplayAnnotation)annotationWithString:(id)a3;
+ (BKDisplayAnnotation)new;
+ (id)subannotationWithString:(id)a3;
- (BKDisplayAnnotation)init;
- (BKDisplayAnnotationContent)content;
- (BKDisplayAnnotationController)annotationController;
- (BKDisplayAnnotationLocation)location;
- (BKDisplayAnnotationRenderer)renderer;
- (BKDisplayAnnotationStyleSheet)styleSheet;
- (BKNamespaceNode)namespaceNode;
- (BOOL)isEqual:(id)a3;
- (NSString)section;
- (id)_init;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)subnodeScreenEdgeTreatment;
- (void)modifyStyleSheet:(id)a3;
- (void)setAnnotationController:(id)a3;
- (void)setContent:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNamespaceNode:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setSection:(id)a3;
- (void)setShapeSize:(CGSize)a3;
- (void)setString:(id)a3;
- (void)setStyleModifier:(id)a3;
- (void)setStyleSheet:(id)a3;
- (void)setSubnodeScreenEdgeTreatment:(int64_t)a3;
@end

@implementation BKDisplayAnnotation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_namespaceNode);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_destroyWeak((id *)&self->_annotationController);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setNamespaceNode:(id)a3
{
}

- (BKNamespaceNode)namespaceNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_namespaceNode);

  return (BKNamespaceNode *)WeakRetained;
}

- (void)setStyleSheet:(id)a3
{
}

- (BKDisplayAnnotationStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)setAnnotationController:(id)a3
{
}

- (BKDisplayAnnotationController)annotationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);

  return (BKDisplayAnnotationController *)WeakRetained;
}

- (BKDisplayAnnotationContent)content
{
  return self->_content;
}

- (void)setSubnodeScreenEdgeTreatment:(int64_t)a3
{
  self->_subnodeScreenEdgeTreatment = a3;
}

- (int64_t)subnodeScreenEdgeTreatment
{
  return self->_subnodeScreenEdgeTreatment;
}

- (void)setSection:(id)a3
{
}

- (NSString)section
{
  return self->_section;
}

- (BKDisplayAnnotationRenderer)renderer
{
  return self->_renderer;
}

- (BKDisplayAnnotationLocation)location
{
  return self->_location;
}

- (void)setStyleModifier:(id)a3
{
  [(BKDisplayAnnotationStyleSheet *)self->_styleSheet setStyleModifier:a3];
  renderer = self->_renderer;

  [(BKDisplayAnnotationRenderer *)renderer styleSheetDidChange];
}

- (void)modifyStyleSheet:(id)a3
{
  (*((void (**)(id, BKDisplayAnnotationStyleSheet *))a3 + 2))(a3, self->_styleSheet);
  renderer = self->_renderer;

  [(BKDisplayAnnotationRenderer *)renderer styleSheetDidChange];
}

- (void)setShapeSize:(CGSize)a3
{
  +[BKDisplayAnnotationShapeContent contentWithSize:](BKDisplayAnnotationShapeContent, "contentWithSize:", a3.width, a3.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(BKDisplayAnnotation *)self setContent:v4];
}

- (void)setString:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(BKDisplayAnnotationContent *)self->_content setString:v6];
    id v4 = v6;
  }
  else
  {
    uint64_t v5 = +[BKDisplayAnnotationStringContent contentWithString:v6];

    [(BKDisplayAnnotation *)self setContent:v5];
    id v4 = (void *)v5;
  }
}

- (void)setLocation:(id)a3
{
  id v4 = (BKDisplayAnnotationLocation *)a3;
  location = self->_location;
  if (location != v4)
  {
    v9 = v4;
    unsigned __int8 v6 = [(BKDisplayAnnotationLocation *)location isEqual:v4];
    id v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (BKDisplayAnnotationLocation *)[(BKDisplayAnnotationLocation *)v9 copy];
      v8 = self->_location;
      self->_location = v7;

      [(BKDisplayAnnotationRenderer *)self->_renderer locationDidChange];
      id v4 = v9;
    }
  }
}

- (void)setContent:(id)a3
{
  unsigned __int8 v6 = (BKDisplayAnnotationContent *)a3;
  content = self->_content;
  if (content != v6)
  {
    if (content)
    {
      v8 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_content == ((void *)0)"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v9 = NSStringFromSelector(a2);
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        v14 = v9;
        __int16 v15 = 2114;
        v16 = v11;
        __int16 v17 = 2048;
        v18 = self;
        __int16 v19 = 2114;
        CFStringRef v20 = @"BKDisplayAnnotation.m";
        __int16 v21 = 1024;
        int v22 = 162;
        __int16 v23 = 2114;
        v24 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100098648);
    }
    v12 = v6;
    objc_storeStrong((id *)&self->_content, a3);
    [(BKDisplayAnnotationRenderer *)self->_renderer styleSheetDidChange];
    unsigned __int8 v6 = v12;
  }
}

- (void)setRenderer:(id)a3
{
  uint64_t v5 = (BKDisplayAnnotationRenderer *)a3;
  if (self->_renderer != v5)
  {
    unsigned __int8 v6 = v5;
    objc_storeStrong((id *)&self->_renderer, a3);
    [(BKDisplayAnnotationRenderer *)self->_renderer setAnnotation:self];
    uint64_t v5 = v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    content = self->_content;
    unsigned __int8 v6 = [v4 content];
    unsigned __int8 v7 = [(BKDisplayAnnotationContent *)content isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)description
{
  return [(BKDisplayAnnotation *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BKDisplayAnnotation *)self succinctDescriptionBuilder];
  id v5 = [v4 appendObject:self->_content withName:@"content"];
  id v6 = [v4 appendObject:self->_section withName:@"section" skipIfNil:1];

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKDisplayAnnotation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKDisplayAnnotation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)BKDisplayAnnotation;
  v2 = [(BKDisplayAnnotation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[BKDisplayAnnotationLocation controlledBySupernode];
    location = v2->_location;
    v2->_location = (BKDisplayAnnotationLocation *)v3;

    id v5 = objc_alloc_init(BKDisplayAnnotationRenderer);
    renderer = v2->_renderer;
    v2->_renderer = v5;

    [(BKDisplayAnnotationRenderer *)v2->_renderer setAnnotation:v2];
  }
  return v2;
}

- (BKDisplayAnnotation)init
{
  id v4 = +[NSString stringWithFormat:@"use one of the factory methods"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    unsigned __int8 v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    CFStringRef v16 = @"BKDisplayAnnotation.m";
    __int16 v17 = 1024;
    int v18 = 86;
    __int16 v19 = 2114;
    CFStringRef v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKDisplayAnnotation *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BKDisplayAnnotation)new
{
  id v4 = +[NSString stringWithFormat:@"use one of the factory methods"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    unsigned __int8 v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    CFStringRef v16 = @"BKDisplayAnnotation.m";
    __int16 v17 = 1024;
    int v18 = 91;
    __int16 v19 = 2114;
    CFStringRef v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKDisplayAnnotation *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BKDisplayAnnotation)annotationWithRectangleSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [objc_alloc((Class)a1) _init];
  [v5 setShapeSize:width, height];
  id v6 = objc_alloc_init(BKDisplayAnnotationStyleSheet);
  unsigned __int8 v7 = +[BKDisplayAnnotationStyle rectangleStyle];
  [(BKDisplayAnnotationStyleSheet *)v6 setBaseStyle:v7];

  objc_super v8 = +[BKDisplayAnnotationStyle minimalStyle];
  [(BKDisplayAnnotationStyleSheet *)v6 setStyleModifier:v8];

  [v5 setStyleSheet:v6];

  return (BKDisplayAnnotation *)v5;
}

+ (BKDisplayAnnotation)annotationWithEllipseSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [objc_alloc((Class)a1) _init];
  [v5 setShapeSize:width height:height];
  id v6 = objc_alloc_init(BKDisplayAnnotationStyleSheet);
  unsigned __int8 v7 = +[BKDisplayAnnotationStyle ellipseStyle];
  [(BKDisplayAnnotationStyleSheet *)v6 setBaseStyle:v7];

  objc_super v8 = +[BKDisplayAnnotationStyle minimalStyle];
  [(BKDisplayAnnotationStyleSheet *)v6 setStyleModifier:v8];

  [v5 setStyleSheet:v6];

  return (BKDisplayAnnotation *)v5;
}

+ (id)subannotationWithString:(id)a3
{
  uint64_t v3 = [a1 annotationWithString:a3];
  id v4 = objc_alloc_init(BKDisplayAnnotationNullRenderer);
  [v3 setRenderer:v4];

  return v3;
}

+ (BKDisplayAnnotation)annotationWithString:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) _init];
  [v5 setString:v4];

  id v6 = objc_alloc_init(BKDisplayAnnotationStyleSheet);
  unsigned __int8 v7 = +[BKDisplayAnnotationStyle textStyle];
  [(BKDisplayAnnotationStyleSheet *)v6 setBaseStyle:v7];

  objc_super v8 = +[BKDisplayAnnotationStyle minimalStyle];
  [(BKDisplayAnnotationStyleSheet *)v6 setStyleModifier:v8];

  [v5 setStyleSheet:v6];

  return (BKDisplayAnnotation *)v5;
}

@end