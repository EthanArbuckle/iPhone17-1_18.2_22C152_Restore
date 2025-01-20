@interface GQDWPTab
+ (const)stateForReading;
- (__CFString)leader;
- (float)position;
- (int)alignment;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDWPTab

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A1E08;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)off_9CD80);
  *(float *)&double v5 = v5;
  self->mPosition = *(float *)&v5;
  self->mAlignment = 0;
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)off_9CD88, *(const xmlChar **)(qword_A35E8 + 16));
  if (AttributeNs)
  {
    v7 = AttributeNs;
    uint64_t v8 = 0;
    while (!xmlStrEqual(v7, (const xmlChar *)off_805A8[v8]))
    {
      if (++v8 == 4) {
        goto LABEL_7;
      }
    }
    self->mAlignment = v8;
LABEL_7:
    xmlFree(v7);
  }
  v9 = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)off_9CD90);
  mLeader = self->mLeader;
  if (mLeader) {
    CFRelease(mLeader);
  }
  self->mLeader = v9;
  return 1;
}

- (void)dealloc
{
  mLeader = self->mLeader;
  if (mLeader) {
    CFRelease(mLeader);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPTab;
  [(GQDWPTab *)&v4 dealloc];
}

- (float)position
{
  return self->mPosition;
}

- (int)alignment
{
  return self->mAlignment;
}

- (__CFString)leader
{
  return self->mLeader;
}

@end