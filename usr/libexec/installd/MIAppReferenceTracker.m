@interface MIAppReferenceTracker
+ (id)managerForInstallationDomain:(unint64_t)a3;
- (BOOL)addReferenceForIdentity:(id)a3 error:(id *)a4;
- (BOOL)finalizeTemporaryReference:(id)a3 error:(id *)a4;
- (BOOL)referenceExists:(BOOL *)a3 forIdentity:(id)a4 error:(id *)a5;
- (BOOL)removeReferenceForIdentity:(id)a3 waitingForSpaceReclaimation:(BOOL)a4 error:(id *)a5;
- (BOOL)revokeTemporaryReference:(id)a3 error:(id *)a4;
- (id)addTemporaryReferenceForIdentity:(id)a3 error:(id *)a4;
- (id)initForInstallationDomain:(unint64_t)a3;
- (unint64_t)domain;
- (void)enumerateAppReferencesWithBlock:(id)a3;
@end

@implementation MIAppReferenceTracker

+ (id)managerForInstallationDomain:(unint64_t)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053644;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A6090 != -1) {
    dispatch_once(&qword_1000A6090, block);
  }
  if (a3 == 2)
  {
    v4 = (void *)qword_1000A6080;
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    v4 = (void *)qword_1000A6088;
LABEL_7:
    id v5 = v4;
    goto LABEL_12;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  id v5 = 0;
LABEL_12:

  return v5;
}

- (id)initForInstallationDomain:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MIAppReferenceTracker;
  id result = [(MIAppReferenceTracker *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (BOOL)referenceExists:(BOOL *)a3 forIdentity:(id)a4 error:(id *)a5
{
  v7 = sub_100014A08((uint64_t)"-[MIAppReferenceTracker referenceExists:forIdentity:error:]", 59, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v5, (uint64_t)"-[MIAppReferenceTracker referenceExists:forIdentity:error:]");
  v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return 0;
}

- (BOOL)addReferenceForIdentity:(id)a3 error:(id *)a4
{
  v6 = sub_100014A08((uint64_t)"-[MIAppReferenceTracker addReferenceForIdentity:error:]", 68, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v4, (uint64_t)"-[MIAppReferenceTracker addReferenceForIdentity:error:]");
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (BOOL)removeReferenceForIdentity:(id)a3 waitingForSpaceReclaimation:(BOOL)a4 error:(id *)a5
{
  v7 = sub_100014A08((uint64_t)"-[MIAppReferenceTracker removeReferenceForIdentity:waitingForSpaceReclaimation:error:]", 77, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v5, (uint64_t)"-[MIAppReferenceTracker removeReferenceForIdentity:waitingForSpaceReclaimation:error:]");
  v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return 0;
}

- (id)addTemporaryReferenceForIdentity:(id)a3 error:(id *)a4
{
  v6 = sub_100014A08((uint64_t)"-[MIAppReferenceTracker addTemporaryReferenceForIdentity:error:]", 86, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v4, (uint64_t)"-[MIAppReferenceTracker addTemporaryReferenceForIdentity:error:]");
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (BOOL)finalizeTemporaryReference:(id)a3 error:(id *)a4
{
  v6 = sub_100014A08((uint64_t)"-[MIAppReferenceTracker finalizeTemporaryReference:error:]", 95, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v4, (uint64_t)"-[MIAppReferenceTracker finalizeTemporaryReference:error:]");
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (BOOL)revokeTemporaryReference:(id)a3 error:(id *)a4
{
  v6 = sub_100014A08((uint64_t)"-[MIAppReferenceTracker revokeTemporaryReference:error:]", 104, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v4, (uint64_t)"-[MIAppReferenceTracker revokeTemporaryReference:error:]");
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (void)enumerateAppReferencesWithBlock:(id)a3
{
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
}

- (unint64_t)domain
{
  return self->_domain;
}

@end