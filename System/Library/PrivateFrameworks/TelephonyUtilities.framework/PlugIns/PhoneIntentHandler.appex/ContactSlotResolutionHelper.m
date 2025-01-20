@interface ContactSlotResolutionHelper
- (ContactPool)availableContacts;
- (ContactSlotResolutionHelper)initWithUnresolvedPerson:(id)a3 availableContacts:(id)a4;
- (INPerson)unresolvedPerson;
- (id)_lookup:(id)a3;
- (id)buildConfirmationResultForContact:(id)a3 withReason:(int64_t)a4;
- (id)buildDisambiguationResultForContacts:(id)a3;
@end

@implementation ContactSlotResolutionHelper

- (ContactSlotResolutionHelper)initWithUnresolvedPerson:(id)a3 availableContacts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ContactSlotResolutionHelper;
  v9 = [(ContactSlotResolutionHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unresolvedPerson, a3);
    objc_storeStrong((id *)&v10->_availableContacts, a4);
  }

  return v10;
}

- (id)buildConfirmationResultForContact:(id)a3 withReason:(int64_t)a4
{
  v6 = [(ContactSlotResolutionHelper *)self _lookup:a3];
  id v7 = [(ContactSlotResolutionHelper *)self unresolvedPerson];
  id v8 = [v7 personHandle];

  v9 = [v8 value];
  id v10 = [v8 type];
  v11 = [v8 label];
  objc_super v12 = +[StartCallIntentHandlerUtilities inPersonFromContact:v6 handleValue:v9 handleType:v10 handleLabel:v11];

  v13 = +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:v12 forReason:a4];

  return v13;
}

- (id)buildDisambiguationResultForContacts:(id)a3
{
  id v4 = a3;
  id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v5 = self;
  v6 = [(ContactSlotResolutionHelper *)self unresolvedPerson];
  id v7 = [v6 personHandle];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = [(ContactSlotResolutionHelper *)v5 _lookup:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        v13 = [v7 value];
        id v14 = [v7 type];
        v15 = [v7 label];
        v16 = +[StartCallIntentHandlerUtilities inPersonFromContact:v12 handleValue:v13 handleType:v14 handleLabel:v15];

        [v20 addObject:v16];
      }
      id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  v17 = +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:v20];

  return v17;
}

- (id)_lookup:(id)a3
{
  id v4 = a3;
  v5 = [(ContactSlotResolutionHelper *)self availableContacts];
  v6 = [v5 contactWithId:v4];

  if (!v6)
  {
    id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Contacts map did not contain UUID of recommended contact." userInfo:0];
    [v7 raise];
  }

  return v6;
}

- (INPerson)unresolvedPerson
{
  return self->_unresolvedPerson;
}

- (ContactPool)availableContacts
{
  return self->_availableContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableContacts, 0);

  objc_storeStrong((id *)&self->_unresolvedPerson, 0);
}

@end