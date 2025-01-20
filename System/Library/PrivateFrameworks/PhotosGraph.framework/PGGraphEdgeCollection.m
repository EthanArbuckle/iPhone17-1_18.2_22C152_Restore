@interface PGGraphEdgeCollection
+ (Class)edgeClass;
+ (MAEdgeFilter)filter;
+ (id)edgesFromNodes:(id)a3;
+ (id)edgesFromNodes:(id)a3 toNodes:(id)a4;
+ (id)edgesInGraph:(id)a3;
+ (id)edgesOfType:(unint64_t)a3 betweenNodes:(id)a4 andNodes:(id)a5;
+ (id)edgesOfType:(unint64_t)a3 onNodes:(id)a4;
+ (id)edgesToNodes:(id)a3;
@end

@implementation PGGraphEdgeCollection

+ (id)edgesOfType:(unint64_t)a3 betweenNodes:(id)a4 andNodes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 filter];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  v11 = objc_msgSendSuper2(&v13, sel_edgesOfType_betweenNodes_andNodes_matchingFilter_, a3, v9, v8, v10);

  return v11;
}

+ (id)edgesOfType:(unint64_t)a3 onNodes:(id)a4
{
  id v6 = a4;
  v7 = [a1 filter];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  id v8 = objc_msgSendSuper2(&v10, sel_edgesOfType_onNodes_matchingFilter_, a3, v6, v7);

  return v8;
}

+ (id)edgesInGraph:(id)a3
{
  id v4 = a3;
  v5 = [a1 filter];
  id v6 = [a1 edgesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (MAEdgeFilter)filter
{
  v2 = (void *)[a1 edgeClass];
  return (MAEdgeFilter *)[v2 filter];
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)edgesFromNodes:(id)a3 toNodes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 filter];
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  id v9 = objc_msgSendSuper2(&v11, sel_edgesFromNodes_toNodes_matchingFilter_, v7, v6, v8);

  return v9;
}

+ (id)edgesToNodes:(id)a3
{
  id v4 = a3;
  v5 = [a1 filter];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  id v6 = objc_msgSendSuper2(&v8, sel_edgesToNodes_matchingFilter_, v4, v5);

  return v6;
}

+ (id)edgesFromNodes:(id)a3
{
  id v4 = a3;
  v5 = [a1 filter];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PGGraphEdgeCollection;
  id v6 = objc_msgSendSuper2(&v8, sel_edgesFromNodes_matchingFilter_, v4, v5);

  return v6;
}

@end