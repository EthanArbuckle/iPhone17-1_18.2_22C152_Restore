@interface PFStoryConcreteMotionStyleTable
- (PFStoryConcreteMotionStyleTable)initWithMotionStylesByColorGrade:(id)a3 defaultFrequencies:(id)a4;
- (id)motionStylesForColorGrade:(id)a3 songPace:(int64_t)a4;
@end

@implementation PFStoryConcreteMotionStyleTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFrequencies, 0);

  objc_storeStrong((id *)&self->_motionStylesByColorGrade, 0);
}

- (id)motionStylesForColorGrade:(id)a3 songPace:(int64_t)a4
{
  v7 = self->_defaultFrequencies;
  v8 = [(NSDictionary *)self->_motionStylesByColorGrade objectForKeyedSubscript:a3];
  if (v8)
  {
    v9 = [NSNumber numberWithInteger:a4];
    v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      v11 = v10;

      v7 = v11;
    }
  }

  return v7;
}

- (PFStoryConcreteMotionStyleTable)initWithMotionStylesByColorGrade:(id)a3 defaultFrequencies:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PFStoryConcreteMotionStyleTable;
  v9 = [(PFStoryConcreteMotionStyleTable *)&v16 init];
  objc_storeStrong((id *)&v9->_motionStylesByColorGrade, a3);
  p_defaultFrequencies = (void **)&v9->_defaultFrequencies;
  objc_storeStrong((id *)&v9->_defaultFrequencies, a4);
  if (!v9->_defaultFrequencies)
  {
    uint64_t v11 = 4;
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    do
    {
      [v12 addObject:&unk_1EF7CA2B0];
      --v11;
    }
    while (v11);
    uint64_t v13 = [v12 copy];

    v14 = *p_defaultFrequencies;
    *p_defaultFrequencies = (void *)v13;
  }
  return v9;
}

@end