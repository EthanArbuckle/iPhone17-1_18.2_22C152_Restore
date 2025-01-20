@interface MapsDragAndDropManager
+ (id)sharedManager;
- (BOOL)canStartNewDrag;
- (BOOL)deviceSupportsDragAndDrop;
- (UIDragSession)dragSession;
- (void)setDragSession:(id)a3;
@end

@implementation MapsDragAndDropManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001090A8;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160F670 != -1) {
    dispatch_once(&qword_10160F670, block);
  }
  v2 = (void *)qword_10160F668;

  return v2;
}

- (BOOL)deviceSupportsDragAndDrop
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)canStartNewDrag
{
  v2 = [(MapsDragAndDropManager *)self dragSession];
  BOOL v3 = v2 == 0;

  return v3;
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (void)setDragSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end