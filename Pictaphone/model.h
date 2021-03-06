//
//  model.h
//  Pictaphone
//
//  Created by Kelly Hutchison on 11/22/14.
//  Copyright (c) 2014 Kelly Hutchison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface model : UIViewController
+(id)sharedInstance;
-(id) __unavailable init;  // make sure no one uses this!  Compiler will report an error if they do.

-(void)initializeGameSettings;

-(NSInteger)instructionPageCount;
-(NSString*)instructionTitleForPage:(NSInteger)pageNumber;
-(NSString*)instructionLineOneForPage:(NSInteger)pageNumber;
-(NSString*)instructionLineTwoForPage:(NSInteger)pageNumber;
-(NSString*)titleForGameMode:(NSString*)gameMode;
-(NSString*)descriptionForGameMode:(NSString*)gameMode;

-(NSString*)imageNameForIndex:(NSInteger)index;
-(NSString*)phraseForIndex:(NSInteger)index;
-(NSInteger)phraseArrayCount;
-(NSInteger)imageNameArrayCount;

// random images
-(UIImage*)randomImage;
-(NSString*)randomPhrase;
-(void)storeChosenRandomPhrase:(NSString*)phrase;
-(void)storeChosenRandomImage:(UIImage*)image;
-(BOOL)isSetRandomPhrase;
-(BOOL)isSetRandomImage;
-(UIImage*)valueOfRandomImage;
-(NSString*)valueOfRandomPhrase;
-(void)setRandomImageStatus:(BOOL)status;
-(void)setRandomPhraseStatus:(BOOL)status;

// game settings
-(void)storePlayerCount:(NSInteger)count;
-(void)storeTurnCount:(NSInteger)count;
-(void)storeAutoGeneratedFirstRoundType:(BOOL)autoGenerated;
-(BOOL)isFirstRoundAutoGenerated;

// game play info
-(NSInteger)turnsRemaining;
-(NSInteger)turnsPerRound;
-(NSInteger)turnsCompleted;
-(void)trackFinishedTurn;
-(void)storeFirstRoundType:(NSString*)type;
-(NSInteger)currentTurn;
-(NSInteger)currentRound;
-(NSInteger)currentPlayer;

// final story images array info
-(void)initializeContentsArray;
-(void)populateContentsArrayWithImage:(UIImage*)drawing;
-(void)populateContentsArrayWithPhrase:(NSString*)phrase;
-(NSInteger)contentsArrayCount;
-(id)valueOfContentsArrayAtIndex:(NSInteger)index;

@end
