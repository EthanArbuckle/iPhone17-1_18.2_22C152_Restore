@interface VGFrameSelectionDumpOutput
+ (BOOL)supportsSecureCoding;
- (NSArray)selectedPoses;
- (VGFrameSelectionDumpOutput)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedPoses:(id)a3;
@end

@implementation VGFrameSelectionDumpOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  selectedPoses = self->_selectedPoses;
  v5 = NSStringFromSelector(sel_selectedPoses);
  [v6 encodeObject:selectedPoses forKey:v5];
}

- (VGFrameSelectionDumpOutput)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VGFrameSelectionDumpOutput;
  v5 = [(VGFrameSelectionDumpOutput *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    v8 = [v6 setWithArray:v7];
    v9 = NSStringFromSelector(sel_selectedPoses);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    selectedPoses = v5->_selectedPoses;
    v5->_selectedPoses = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (NSArray)selectedPoses
{
  return self->_selectedPoses;
}

- (void)setSelectedPoses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end