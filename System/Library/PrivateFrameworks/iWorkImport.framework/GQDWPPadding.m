@interface GQDWPPadding
+ (const)stateForReading;
- (float)bottom;
- (float)left;
- (float)right;
- (float)top;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
@end

@implementation GQDWPPadding

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)off_9CD60);
  *(float *)&double v5 = v5;
  self->mTop = *(float *)&v5;
  sub_433CC(a3, qword_A35E8, (xmlChar *)off_9CD68);
  *(float *)&double v6 = v6;
  self->mLeft = *(float *)&v6;
  sub_433CC(a3, qword_A35E8, (xmlChar *)off_9CD70);
  *(float *)&double v7 = v7;
  self->mBottom = *(float *)&v7;
  sub_433CC(a3, qword_A35E8, (xmlChar *)off_9CD78);
  *(float *)&double v8 = v8;
  self->mRight = *(float *)&v8;
  return 1;
}

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A1A58;
}

- (float)top
{
  return self->mTop;
}

- (float)left
{
  return self->mLeft;
}

- (float)bottom
{
  return self->mBottom;
}

- (float)right
{
  return self->mRight;
}

@end