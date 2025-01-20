@interface ULBGNonRepeatingSystemTaskRequest
- (ULBGNonRepeatingSystemTaskRequest)initWithIdentifier:(id)a3 scheduleAfter:(double)a4 trySchedulingBefore:(double)a5;
- (double)scheduleAfter;
- (double)trySchedulingBefore;
- (id)createRequestFromSelf;
- (void)setScheduleAfter:(double)a3;
- (void)setTrySchedulingBefore:(double)a3;
@end

@implementation ULBGNonRepeatingSystemTaskRequest

- (ULBGNonRepeatingSystemTaskRequest)initWithIdentifier:(id)a3 scheduleAfter:(double)a4 trySchedulingBefore:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)ULBGNonRepeatingSystemTaskRequest;
  v7 = [(ULBGSystemTaskRequest *)&v10 initWithIdentifier:a3];
  v8 = v7;
  if (v7)
  {
    [(ULBGNonRepeatingSystemTaskRequest *)v7 setScheduleAfter:a4];
    [(ULBGNonRepeatingSystemTaskRequest *)v8 setTrySchedulingBefore:a5];
  }
  return v8;
}

- (id)createRequestFromSelf
{
  id v3 = objc_alloc(MEMORY[0x263F298E0]);
  v4 = [(ULBGSystemTaskRequest *)self identifier];
  v5 = (void *)[v3 initWithIdentifier:v4];

  [(ULBGNonRepeatingSystemTaskRequest *)self scheduleAfter];
  objc_msgSend(v5, "setScheduleAfter:");
  [(ULBGNonRepeatingSystemTaskRequest *)self trySchedulingBefore];
  objc_msgSend(v5, "setTrySchedulingBefore:");
  objc_msgSend(v5, "setPriority:", -[ULBGSystemTaskRequest priority](self, "priority"));
  objc_msgSend(v5, "setRequiresProtectionClass:", -[ULBGSystemTaskRequest requiresProtectionClass](self, "requiresProtectionClass"));
  objc_msgSend(v5, "setResourceIntensive:", -[ULBGSystemTaskRequest resourceIntensive](self, "resourceIntensive"));
  objc_msgSend(v5, "setResources:", -[ULBGSystemTaskRequest resources](self, "resources"));
  objc_msgSend(v5, "setRequiresBuddyComplete:", -[ULBGSystemTaskRequest requiresBuddyComplete](self, "requiresBuddyComplete"));
  objc_msgSend(v5, "setRequiresUserInactivity:", -[ULBGSystemTaskRequest requiresUserInactivity](self, "requiresUserInactivity"));
  objc_msgSend(v5, "setPostInstall:", -[ULBGSystemTaskRequest postInstall](self, "postInstall"));
  return v5;
}

- (double)scheduleAfter
{
  return self->_scheduleAfter;
}

- (void)setScheduleAfter:(double)a3
{
  self->_scheduleAfter = a3;
}

- (double)trySchedulingBefore
{
  return self->_trySchedulingBefore;
}

- (void)setTrySchedulingBefore:(double)a3
{
  self->_trySchedulingBefore = a3;
}

@end