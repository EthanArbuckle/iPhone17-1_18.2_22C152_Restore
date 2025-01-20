@interface SBHTestAppIconDescriptor(SBAdditions)
+ (id)appStore;
+ (id)books;
+ (id)camera;
+ (id)contacts;
+ (id)documents;
+ (id)facetime;
+ (id)findMy;
+ (id)health;
+ (id)home;
+ (id)iTunesStore;
+ (id)maps;
+ (id)news;
+ (id)passbook;
+ (id)podcasts;
+ (id)preferences;
+ (id)reminders;
+ (id)shortcuts;
+ (id)tips;
+ (id)translate;
+ (id)tv;
+ (id)watch;
@end

@implementation SBHTestAppIconDescriptor(SBAdditions)

+ (id)documents
{
  if (documents_sbf_once_token_0 != -1) {
    dispatch_once(&documents_sbf_once_token_0, &__block_literal_global_175);
  }
  v0 = (void *)documents_sbf_once_object_0;
  return v0;
}

+ (id)findMy
{
  if (findMy_sbf_once_token_1 != -1) {
    dispatch_once(&findMy_sbf_once_token_1, &__block_literal_global_3);
  }
  v0 = (void *)findMy_sbf_once_object_1;
  return v0;
}

+ (id)shortcuts
{
  if (shortcuts_sbf_once_token_2 != -1) {
    dispatch_once(&shortcuts_sbf_once_token_2, &__block_literal_global_8_0);
  }
  v0 = (void *)shortcuts_sbf_once_object_2;
  return v0;
}

+ (id)iTunesStore
{
  if (iTunesStore_sbf_once_token_3 != -1) {
    dispatch_once(&iTunesStore_sbf_once_token_3, &__block_literal_global_13_0);
  }
  v0 = (void *)iTunesStore_sbf_once_object_3;
  return v0;
}

+ (id)tips
{
  if (tips_sbf_once_token_4 != -1) {
    dispatch_once(&tips_sbf_once_token_4, &__block_literal_global_18_1);
  }
  v0 = (void *)tips_sbf_once_object_4;
  return v0;
}

+ (id)translate
{
  if (translate_sbf_once_token_5 != -1) {
    dispatch_once(&translate_sbf_once_token_5, &__block_literal_global_23_2);
  }
  v0 = (void *)translate_sbf_once_object_5;
  return v0;
}

+ (id)contacts
{
  if (contacts_sbf_once_token_6 != -1) {
    dispatch_once(&contacts_sbf_once_token_6, &__block_literal_global_28_0);
  }
  v0 = (void *)contacts_sbf_once_object_6;
  return v0;
}

+ (id)watch
{
  if (watch_sbf_once_token_7 != -1) {
    dispatch_once(&watch_sbf_once_token_7, &__block_literal_global_33_1);
  }
  v0 = (void *)watch_sbf_once_object_7;
  return v0;
}

+ (id)health
{
  if (health_sbf_once_token_8 != -1) {
    dispatch_once(&health_sbf_once_token_8, &__block_literal_global_38);
  }
  v0 = (void *)health_sbf_once_object_8;
  return v0;
}

+ (id)home
{
  if (home_sbf_once_token_9 != -1) {
    dispatch_once(&home_sbf_once_token_9, &__block_literal_global_43_3);
  }
  v0 = (void *)home_sbf_once_object_9;
  return v0;
}

+ (id)passbook
{
  if (passbook_sbf_once_token_10 != -1) {
    dispatch_once(&passbook_sbf_once_token_10, &__block_literal_global_48_2);
  }
  v0 = (void *)passbook_sbf_once_object_10;
  return v0;
}

+ (id)preferences
{
  if (preferences_sbf_once_token_11 != -1) {
    dispatch_once(&preferences_sbf_once_token_11, &__block_literal_global_50_2);
  }
  v0 = (void *)preferences_sbf_once_object_11;
  return v0;
}

+ (id)facetime
{
  if (facetime_sbf_once_token_12 != -1) {
    dispatch_once(&facetime_sbf_once_token_12, &__block_literal_global_52_1);
  }
  v0 = (void *)facetime_sbf_once_object_12;
  return v0;
}

+ (id)reminders
{
  if (reminders_sbf_once_token_13 != -1) {
    dispatch_once(&reminders_sbf_once_token_13, &__block_literal_global_54_0);
  }
  v0 = (void *)reminders_sbf_once_object_13;
  return v0;
}

+ (id)maps
{
  if (maps_sbf_once_token_14 != -1) {
    dispatch_once(&maps_sbf_once_token_14, &__block_literal_global_59);
  }
  v0 = (void *)maps_sbf_once_object_14;
  return v0;
}

+ (id)camera
{
  if (camera_sbf_once_token_15 != -1) {
    dispatch_once(&camera_sbf_once_token_15, &__block_literal_global_61_0);
  }
  v0 = (void *)camera_sbf_once_object_15;
  return v0;
}

+ (id)appStore
{
  if (appStore_sbf_once_token_16 != -1) {
    dispatch_once(&appStore_sbf_once_token_16, &__block_literal_global_63);
  }
  v0 = (void *)appStore_sbf_once_object_16;
  return v0;
}

+ (id)books
{
  if (books_sbf_once_token_17 != -1) {
    dispatch_once(&books_sbf_once_token_17, &__block_literal_global_65_0);
  }
  v0 = (void *)books_sbf_once_object_17;
  return v0;
}

+ (id)podcasts
{
  if (podcasts_sbf_once_token_18 != -1) {
    dispatch_once(&podcasts_sbf_once_token_18, &__block_literal_global_70_0);
  }
  v0 = (void *)podcasts_sbf_once_object_18;
  return v0;
}

+ (id)tv
{
  if (tv_sbf_once_token_19 != -1) {
    dispatch_once(&tv_sbf_once_token_19, &__block_literal_global_75_1);
  }
  v0 = (void *)tv_sbf_once_object_19;
  return v0;
}

+ (id)news
{
  if (news_sbf_once_token_20 != -1) {
    dispatch_once(&news_sbf_once_token_20, &__block_literal_global_80_2);
  }
  v0 = (void *)news_sbf_once_object_20;
  return v0;
}

@end