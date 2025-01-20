@interface MIReferenceAwareLSDatabaseGatherer
- (BOOL)performGatherWithError:(id *)a3;
- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6;
- (MIReferenceAwareLSDatabaseGatherer)initWithOptions:(unint64_t)a3 forTargetUID:(unsigned int)a4 enumerator:(id)a5;
- (unsigned)targetUID;
- (void)setTargetUID:(unsigned int)a3;
@end

@implementation MIReferenceAwareLSDatabaseGatherer

- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!+[ICLFeatureFlags appReferencesEnabled]) {
    goto LABEL_16;
  }
  if ([(MIReferenceAwareLSDatabaseGatherer *)self targetUID]
    || [v11 containerClass] != (id)14)
  {
    if (([v10 isRemovableSystemApp] & 1) != 0
      || ![(MIReferenceAwareLSDatabaseGatherer *)self targetUID])
    {
      goto LABEL_16;
    }
    if ([v11 containerClass] == (id)14) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 2;
    }
    v15 = +[MIAppReferenceManager defaultManager];
    v16 = [v10 identifier];
    id v24 = 0;
    v17 = [v15 personaUniqueStringsForAppWithBundleID:v16 domain:v14 forUserWithID:-[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID") error:&v24];
    id v18 = v24;

    unsigned __int8 v13 = v17 != 0;
    if (v17)
    {
      if ([v17 count])
      {

LABEL_16:
        v23.receiver = self;
        v23.super_class = (Class)MIReferenceAwareLSDatabaseGatherer;
        unsigned __int8 v13 = [(MIReferenceAwareLSDatabaseGatherer *)&v23 scanExecutableBundle:v10 inContainer:v11 forPersona:v12 withError:a6];
        goto LABEL_17;
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        v22 = [v10 identifier];
        [(MIReferenceAwareLSDatabaseGatherer *)self targetUID];
        MOLogWrite();
      }
    }
    else
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        v21 = [v10 identifier];
        MOLogWrite();
      }
      if (a6) {
        *a6 = v18;
      }
    }

    goto LABEL_17;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    v20 = [v10 identifier];
    MOLogWrite();
  }
  unsigned __int8 v13 = 1;
LABEL_17:

  return v13;
}

- (MIReferenceAwareLSDatabaseGatherer)initWithOptions:(unint64_t)a3 forTargetUID:(unsigned int)a4 enumerator:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)MIReferenceAwareLSDatabaseGatherer;
  v6 = [(MIReferenceAwareLSDatabaseGatherer *)&v9 initWithOptions:a3 enumerator:a5];
  v7 = v6;
  if (v6) {
    [(MIReferenceAwareLSDatabaseGatherer *)v6 setTargetUID:v5];
  }
  return v7;
}

- (BOOL)performGatherWithError:(id *)a3
{
  uint64_t v5 = +[MILaunchServicesOperationManager instanceForCurrentUser];
  [v5 purge];

  v6 = +[MIGlobalConfiguration sharedInstance];
  unsigned __int8 v7 = [v6 isSharediPad];

  if ((v7 & 1) == 0)
  {
    v8 = +[MILaunchServicesOperationManager instanceForSystemSharedContent];
    [v8 purge];
  }
  v10.receiver = self;
  v10.super_class = (Class)MIReferenceAwareLSDatabaseGatherer;
  return [(MIReferenceAwareLSDatabaseGatherer *)&v10 performGatherWithError:a3];
}

- (unsigned)targetUID
{
  return self->_targetUID;
}

- (void)setTargetUID:(unsigned int)a3
{
  self->_targetUID = a3;
}

@end