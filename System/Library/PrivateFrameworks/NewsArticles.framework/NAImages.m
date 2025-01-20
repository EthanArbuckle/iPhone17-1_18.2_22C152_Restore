@interface NAImages
+ (UIImage)copyLinkActivity;
+ (UIImage)downArrow;
+ (UIImage)downloadIssueActivity;
+ (UIImage)iconArticleMarkingShare;
+ (UIImage)iconConcernSelect;
+ (UIImage)iconTextSizeControl;
+ (UIImage)iconTextSizeControlCompact;
+ (UIImage)iconTextSizeControlLarger;
+ (UIImage)iconTextSizeControlSmaller;
+ (UIImage)leftArrow;
+ (UIImage)moreActions;
+ (UIImage)openChannelActivity;
+ (UIImage)openInSafariActivity;
+ (UIImage)play;
+ (UIImage)playLast;
+ (UIImage)playNext;
+ (UIImage)playing;
+ (UIImage)readStory;
+ (UIImage)reload;
+ (UIImage)remove;
+ (UIImage)removeIssueActivity;
+ (UIImage)removeIssueFromMyMagazinesActivity;
+ (UIImage)reportActivity;
+ (UIImage)rightArrow;
+ (UIImage)sharrow;
+ (UIImage)sharrowCompact;
+ (UIImage)upArrow;
- (NAImages)init;
@end

@implementation NAImages

+ (UIImage)iconTextSizeControl
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, qword_1EBA5DF60, (void **)&qword_1EBA5DA80);
}

+ (UIImage)iconTextSizeControlCompact
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA56578, (void **)&qword_1EBA55F50);
}

+ (UIImage)iconTextSizeControlLarger
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA1511C0, (void **)&qword_1EA1583F0);
}

+ (UIImage)iconTextSizeControlSmaller
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA1511C8, (void **)&qword_1EA1583F8);
}

+ (UIImage)moreActions
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA566E0, (void **)&qword_1EBA566D0);
}

+ (UIImage)sharrow
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA5E778, (void **)&qword_1EBA5DA88);
}

+ (UIImage)sharrowCompact
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA56560, (void **)&qword_1EBA55F48);
}

+ (UIImage)rightArrow
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA5E768, (void **)&qword_1EBA5DA78);
}

+ (UIImage)leftArrow
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA5DF70, (void **)&qword_1EBA5DA90);
}

+ (UIImage)upArrow
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA1511D8, (void **)&qword_1EA158400);
}

+ (UIImage)downArrow
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA1511E0, (void **)&qword_1EA158408);
}

+ (UIImage)playing
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, qword_1EA1511E8, (void **)&qword_1EA158410);
}

+ (UIImage)play
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, qword_1EBA55FD0, (void **)&qword_1EBA55F58);
}

+ (UIImage)playNext
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA56588, (void **)&qword_1EBA55F68);
}

+ (UIImage)playLast
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA56580, (void **)&qword_1EBA55F60);
}

+ (UIImage)readStory
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA1511F8, (void **)&qword_1EA158418);
}

+ (UIImage)remove
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA151200, (void **)&qword_1EA158420);
}

+ (UIImage)reload
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA151208, (void **)&qword_1EA158428);
}

+ (UIImage)copyLinkActivity
{
  if (qword_1EA151210 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EA158430;
  return (UIImage *)v2;
}

+ (UIImage)reportActivity
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EBA55FC8, (void **)&qword_1EBA55F40);
}

+ (UIImage)openInSafariActivity
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, qword_1EA151220, (void **)&qword_1EA158438);
}

+ (UIImage)iconArticleMarkingShare
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, qword_1EBA56568, (void **)&qword_1EBA55F08);
}

+ (UIImage)openChannelActivity
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA151230, (void **)&qword_1EA158440);
}

+ (UIImage)removeIssueActivity
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA151238, (void **)&qword_1EA158448);
}

+ (UIImage)downloadIssueActivity
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA151240, (void **)&qword_1EA158450);
}

+ (UIImage)removeIssueFromMyMagazinesActivity
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA151248, (void **)&qword_1EA158458);
}

+ (UIImage)iconConcernSelect
{
  return (UIImage *)sub_1BF7B8138((uint64_t)a1, (uint64_t)a2, &qword_1EA151268, (void **)&qword_1EA158460);
}

- (NAImages)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Images();
  return [(NAImages *)&v3 init];
}

@end