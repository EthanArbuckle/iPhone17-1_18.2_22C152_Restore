@interface TTRIListSharingPresenter
- (void)requestCancelAddingSharees;
- (void)requestCommitAddingSharees;
@end

@implementation TTRIListSharingPresenter

- (void)requestCancelAddingSharees
{
  if (*(void *)self->addShareesViewController)
  {
    sub_100038D28(self->router, *(void *)&self->router[24]);
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    swift_retain();
    if (Strong)
    {
      id v4 = [Strong popViewControllerAnimated:1];
    }
    id v5 = *(id *)self->addShareesViewController;
    *(void *)self->addShareesViewController = 0;
    swift_release();
  }
}

- (void)requestCommitAddingSharees
{
  swift_retain();
  sub_1003B5650();

  swift_release();
}

@end