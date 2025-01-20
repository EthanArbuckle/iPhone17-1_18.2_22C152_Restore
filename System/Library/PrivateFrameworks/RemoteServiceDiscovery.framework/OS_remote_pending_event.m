@interface OS_remote_pending_event
- (void)dealloc;
@end

@implementation OS_remote_pending_event

- (void)dealloc
{
  service_name = (char *)self->service_name;
  if (service_name) {
    free(service_name);
  }
  v4.receiver = self;
  v4.super_class = (Class)OS_remote_pending_event;
  [(OS_remote_pending_event *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->next, 0);
  objc_storeStrong((id *)&self->event, 0);
}

@end