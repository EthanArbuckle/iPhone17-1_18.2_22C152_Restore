@interface TUITriggerBox
+ (unint64_t)observationModeFromString:(id)a3;
- (Class)layoutClass;
- (NSString)name;
- (double)anchorOffset;
- (unint64_t)observationMode;
- (void)setAnchorOffset:(double)a3;
- (void)setName:(id)a3;
- (void)setObservationMode:(unint64_t)a3;
@end

@implementation TUITriggerBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)observationModeFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_2DF540 != -1)
  {
    dispatch_once(&qword_2DF540, &stru_2547E0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF538 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

- (double)anchorOffset
{
  return self->_anchorOffset;
}

- (void)setAnchorOffset:(double)a3
{
  self->_anchorOffset = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)observationMode
{
  return self->_observationMode;
}

- (void)setObservationMode:(unint64_t)a3
{
  self->_observationMode = a3;
}

- (void).cxx_destruct
{
}

@end