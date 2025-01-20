@interface UIMotionEffectGroup
- (NSArray)motionEffects;
- (UIMotionEffectGroup)initWithCoder:(id)a3;
- (id)_keyPathsAndRelativeValuesForPose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMotionEffects:(NSArray *)motionEffects;
@end

@implementation UIMotionEffectGroup

- (id)_keyPathsAndRelativeValuesForPose:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = self->_motionEffects;
  uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        v6 = [*(id *)(*((void *)&v25 + 1) + 8 * i) _keyPathsAndRelativeValuesForPose:v19];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * j);
              v12 = [v6 objectForKeyedSubscript:v11];
              v13 = [v4 objectForKey:v11];
              v14 = v13;
              if (v13)
              {
                uint64_t v15 = objc_msgSend(v13, "CA_addValue:multipliedBy:", v12, 1);

                v12 = (void *)v15;
              }
              if (v12) {
                [v4 setObject:v12 forKey:v11];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v8);
        }
      }
      uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  return v4;
}

- (void)setMotionEffects:(NSArray *)motionEffects
{
}

- (void).cxx_destruct
{
}

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  v6 = objc_alloc_init(_UIViewerRelativeDevicePose);
  -[_UIViewerRelativeDevicePose setViewerOffset:](v6, "setViewerOffset:", horizontal, vertical);
  uint64_t v7 = [(UIMotionEffectGroup *)self _keyPathsAndRelativeValuesForPose:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(UIMotionEffectGroup);
  objc_storeStrong((id *)&v4->_motionEffects, self->_motionEffects);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (UIMotionEffectGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIMotionEffectGroup;
  v5 = [(UIMotionEffect *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_motionEffects"];
    motionEffects = v5->_motionEffects;
    v5->_motionEffects = (NSArray *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p motionEffects=<%@: %p>>", v5, self, v7, self->_motionEffects];

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p motionEffects=%@>", v5, self, self->_motionEffects];

  return v6;
}

- (NSArray)motionEffects
{
  return self->_motionEffects;
}

@end