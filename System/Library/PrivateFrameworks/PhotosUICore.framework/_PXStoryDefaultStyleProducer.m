@interface _PXStoryDefaultStyleProducer
- (PXStoryConfiguration)storyConfiguration;
- (_PXStoryDefaultStyleProducer)initWithStoryConfiguration:(id)a3;
- (id)styleWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9;
@end

@implementation _PXStoryDefaultStyleProducer

- (void).cxx_destruct
{
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (id)styleWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_thumbnailOnly)
  {
    id v17 = a4;
    v18 = [[PXStoryConcreteThumbnailOnlyStyle alloc] initWithCustomColorGradeKind:a3 originalColorGradeCategory:v17];
  }
  else
  {
    id v19 = a4;
    v20 = [PXStoryConcreteStyle alloc];
    id v17 = [(_PXStoryDefaultStyleProducer *)self storyConfiguration];
    LOBYTE(v22) = a9;
    v18 = -[PXStoryConcreteStyle initWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:storyConfiguration:](v20, "initWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:storyConfiguration:", a3, v19, v14, v15, v16, a8.var0, *(void *)&a8.var1, v22, v17);
  }
  return v18;
}

- (_PXStoryDefaultStyleProducer)initWithStoryConfiguration:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PXStoryDefaultStyleProducer;
  v6 = [(_PXStoryDefaultStyleProducer *)&v8 init];
  if (v6)
  {
    v6->_thumbnailOnly = ([v5 options] & 2) != 0;
    objc_storeStrong((id *)&v6->_storyConfiguration, a3);
  }

  return v6;
}

@end