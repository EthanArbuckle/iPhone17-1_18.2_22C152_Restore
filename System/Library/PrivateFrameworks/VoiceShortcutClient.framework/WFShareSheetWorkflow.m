@interface WFShareSheetWorkflow
+ (BOOL)supportsSecureCoding;
- (CGImage)iconImage;
- (NSString)identifier;
- (NSString)name;
- (WFShareSheetWorkflow)initWithCoder:(id)a3;
- (WFShareSheetWorkflow)initWithIdentifier:(id)a3 name:(id)a4 glyphCharacter:(unsigned __int16)a5;
- (double)iconScale;
- (unsigned)glyphCharacter;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIconImage:(CGImage *)a3 scale:(double)a4;
@end

@implementation WFShareSheetWorkflow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (CGImage)iconImage
{
  return self->_iconImage;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFShareSheetWorkflow)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  unsigned __int16 v7 = [v4 decodeInt32ForKey:@"glyphCharacter"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = [(WFShareSheetWorkflow *)self initWithIdentifier:v5 name:v6 glyphCharacter:v7];
    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(WFShareSheetWorkflow *)self identifier];
  [v6 encodeObject:v4 forKey:@"identifier"];

  v5 = [(WFShareSheetWorkflow *)self name];
  [v6 encodeObject:v5 forKey:@"name"];

  objc_msgSend(v6, "encodeInt32:forKey:", -[WFShareSheetWorkflow glyphCharacter](self, "glyphCharacter"), @"glyphCharacter");
}

- (void)setIconImage:(CGImage *)a3 scale:(double)a4
{
  CGImageRelease(self->_iconImage);
  self->_iconImage = a3;
  self->_iconScale = a4;
  CGImageRetain(a3);
}

- (void)dealloc
{
  CGImageRelease(self->_iconImage);
  v3.receiver = self;
  v3.super_class = (Class)WFShareSheetWorkflow;
  [(WFShareSheetWorkflow *)&v3 dealloc];
}

- (WFShareSheetWorkflow)initWithIdentifier:(id)a3 name:(id)a4 glyphCharacter:(unsigned __int16)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFShareSheetWorkflow.m", 18, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WFShareSheetWorkflow.m", 19, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)WFShareSheetWorkflow;
  v12 = [(WFShareSheetWorkflow *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    name = v12->_name;
    v12->_name = (NSString *)v15;

    v12->_glyphCharacter = a5;
    v17 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end