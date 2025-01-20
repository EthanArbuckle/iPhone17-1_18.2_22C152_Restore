@interface PXSocialGroupActionFactory
+ (id)actionForAddingPeople:(id)a3 toSocialGroup:(id)a4;
+ (id)actionForCreatingSocialGroupWithPeople:(id)a3;
+ (id)actionForRemovingPeople:(id)a3 fromSocialGroup:(id)a4;
+ (id)actionForRenamingSocialGroup:(id)a3 newTitle:(id)a4;
@end

@implementation PXSocialGroupActionFactory

+ (id)actionForRenamingSocialGroup:(id)a3 newTitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[PXModifySocialGroupAction initWithOriginalSocialGroup:newKeyAsset:newCustomTitle:customTitleWasDeleted:peopleToBeAdded:peopleToBeRemoved:]([PXModifySocialGroupAction alloc], "initWithOriginalSocialGroup:newKeyAsset:newCustomTitle:customTitleWasDeleted:peopleToBeAdded:peopleToBeRemoved:", v6, 0, v5, [v5 length] == 0, 0, 0);

  return v7;
}

+ (id)actionForRemovingPeople:(id)a3 fromSocialGroup:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [PXModifySocialGroupAction alloc];
  v8 = [v6 fetchedObjects];

  v9 = [(PXModifySocialGroupAction *)v7 initWithOriginalSocialGroup:v5 newKeyAsset:0 newCustomTitle:0 customTitleWasDeleted:0 peopleToBeAdded:0 peopleToBeRemoved:v8];
  return v9;
}

+ (id)actionForAddingPeople:(id)a3 toSocialGroup:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [PXModifySocialGroupAction alloc];
  v8 = [v6 fetchedObjects];

  v9 = [(PXModifySocialGroupAction *)v7 initWithOriginalSocialGroup:v5 newKeyAsset:0 newCustomTitle:0 customTitleWasDeleted:0 peopleToBeAdded:v8 peopleToBeRemoved:0];
  return v9;
}

+ (id)actionForCreatingSocialGroupWithPeople:(id)a3
{
  id v3 = a3;
  v4 = [[PXCreateSocialGroupAction alloc] initWithPeople:v3 customTitle:0 creationCompletionBlock:0];

  return v4;
}

@end