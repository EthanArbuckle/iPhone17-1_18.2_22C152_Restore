@interface VGEarFrameDumpOutput
+ (BOOL)supportsSecureCoding;
- (NSArray)leftEarEnrolledPoses;
- (NSArray)rightEarEnrolledPoses;
- (NSDictionary)leftEarEnrolledYawToBoundingBox;
- (NSDictionary)rightEarEnrolledYawToBoundingBox;
- (VGEarFrameDumpOutput)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLeftEarEnrolledPoses:(id)a3;
- (void)setLeftEarEnrolledYawToBoundingBox:(id)a3;
- (void)setRightEarEnrolledPoses:(id)a3;
- (void)setRightEarEnrolledYawToBoundingBox:(id)a3;
@end

@implementation VGEarFrameDumpOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  leftEarEnrolledPoses = self->_leftEarEnrolledPoses;
  v5 = NSStringFromSelector(sel_leftEarEnrolledPoses);
  [v12 encodeObject:leftEarEnrolledPoses forKey:v5];

  rightEarEnrolledPoses = self->_rightEarEnrolledPoses;
  v7 = NSStringFromSelector(sel_rightEarEnrolledPoses);
  [v12 encodeObject:rightEarEnrolledPoses forKey:v7];

  leftEarEnrolledYawToBoundingBox = self->_leftEarEnrolledYawToBoundingBox;
  v9 = NSStringFromSelector(sel_leftEarEnrolledYawToBoundingBox);
  [v12 encodeObject:leftEarEnrolledYawToBoundingBox forKey:v9];

  rightEarEnrolledYawToBoundingBox = self->_rightEarEnrolledYawToBoundingBox;
  v11 = NSStringFromSelector(sel_rightEarEnrolledYawToBoundingBox);
  [v12 encodeObject:rightEarEnrolledYawToBoundingBox forKey:v11];
}

- (VGEarFrameDumpOutput)initWithCoder:(id)a3
{
  v36[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VGEarFrameDumpOutput;
  v5 = [(VGEarFrameDumpOutput *)&v32 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    v8 = [v6 setWithArray:v7];
    v9 = NSStringFromSelector(sel_leftEarEnrolledPoses);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    leftEarEnrolledPoses = v5->_leftEarEnrolledPoses;
    v5->_leftEarEnrolledPoses = (NSArray *)v10;

    id v12 = (void *)MEMORY[0x263EFFA08];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    v14 = [v12 setWithArray:v13];
    v15 = NSStringFromSelector(sel_rightEarEnrolledPoses);
    uint64_t v16 = [v4 decodeObjectOfClasses:v14 forKey:v15];
    rightEarEnrolledPoses = v5->_rightEarEnrolledPoses;
    v5->_rightEarEnrolledPoses = (NSArray *)v16;

    v18 = (void *)MEMORY[0x263EFFA08];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    v34[3] = objc_opt_class();
    v34[4] = objc_opt_class();
    v34[5] = objc_opt_class();
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:6];
    v20 = [v18 setWithArray:v19];
    v21 = NSStringFromSelector(sel_leftEarEnrolledYawToBoundingBox);
    uint64_t v22 = [v4 decodeObjectOfClasses:v20 forKey:v21];
    leftEarEnrolledYawToBoundingBox = v5->_leftEarEnrolledYawToBoundingBox;
    v5->_leftEarEnrolledYawToBoundingBox = (NSDictionary *)v22;

    v24 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v33[4] = objc_opt_class();
    v33[5] = objc_opt_class();
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:6];
    v26 = [v24 setWithArray:v25];
    v27 = NSStringFromSelector(sel_rightEarEnrolledYawToBoundingBox);
    uint64_t v28 = [v4 decodeObjectOfClasses:v26 forKey:v27];
    rightEarEnrolledYawToBoundingBox = v5->_rightEarEnrolledYawToBoundingBox;
    v5->_rightEarEnrolledYawToBoundingBox = (NSDictionary *)v28;

    v30 = v5;
  }

  return v5;
}

- (NSArray)leftEarEnrolledPoses
{
  return self->_leftEarEnrolledPoses;
}

- (void)setLeftEarEnrolledPoses:(id)a3
{
}

- (NSArray)rightEarEnrolledPoses
{
  return self->_rightEarEnrolledPoses;
}

- (void)setRightEarEnrolledPoses:(id)a3
{
}

- (NSDictionary)leftEarEnrolledYawToBoundingBox
{
  return self->_leftEarEnrolledYawToBoundingBox;
}

- (void)setLeftEarEnrolledYawToBoundingBox:(id)a3
{
}

- (NSDictionary)rightEarEnrolledYawToBoundingBox
{
  return self->_rightEarEnrolledYawToBoundingBox;
}

- (void)setRightEarEnrolledYawToBoundingBox:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarEnrolledYawToBoundingBox, 0);
  objc_storeStrong((id *)&self->_leftEarEnrolledYawToBoundingBox, 0);
  objc_storeStrong((id *)&self->_rightEarEnrolledPoses, 0);

  objc_storeStrong((id *)&self->_leftEarEnrolledPoses, 0);
}

@end